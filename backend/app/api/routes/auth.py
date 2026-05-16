from fastapi import APIRouter, Depends, HTTPException
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from sqlalchemy.orm import Session
from sqlalchemy import select

from app.api.deps import get_db, get_current_user
from app.models.user import User
from app.schemas.auth import LoginIn, RegisterIn, ForgotPasswordIn, ResetPasswordIn, PasswordResetResponse
from app.schemas.verification import (
    VerifyEmailIn, ResendCodeIn, VerificationResponse, SignupResponse
)
from app.core.security import (
    verify_password, hash_password, create_access_token,
    create_refresh_token, decode_token, blacklist_token
)
from app.core.config import settings
from app.core.rate_limit import login_rate_limiter
from app.services.email import (
    create_verification_code, send_verification_email,
    verify_code, count_recent_codes, send_password_reset_email
)

router = APIRouter(prefix="/auth", tags=["auth"])


def _user_out(user: User) -> dict:
    """Generate auth response with access and refresh tokens."""
    return {
        "user": {
            "id": user.id,
            "name": getattr(user, "name", None),
            "email": user.email,
            "email_verified": user.email_verified,
            "onboarding_completed": user.onboarding_completed
        },
        "access_token": create_access_token(user.email),
        "refresh_token": create_refresh_token(user.email),
        "token_type": "bearer",
        "expires_in": 900  # 15 minutes in seconds
    }


@router.post("/signup", response_model=SignupResponse)
def signup(body: RegisterIn, db: Session = Depends(get_db)):
    """
    Register a new user.
    Creates an unverified user and sends a verification code.
    Uses silent success pattern to prevent email enumeration.
    """
    exists = db.scalar(select(User).where(User.email == body.email))

    if exists:
        # Return same response to prevent email enumeration
        # If email exists and unverified, resend code
        if not exists.email_verified:
            code = create_verification_code(db, exists)
            send_verification_email(exists, code.code)
        # Always return success message (don't reveal if email exists)
        return SignupResponse(
            message="If this email is not registered, you will receive a verification code.",
            email=body.email,
            requires_verification=True
        )

    # Create unverified user (no recipes assigned yet)
    user = User(
        name=body.name,
        email=body.email,
        password_hash=hash_password(body.password),
        email_verified=False,
        onboarding_completed=False
    )
    db.add(user)
    db.commit()
    db.refresh(user)

    # Create and send verification code
    code = create_verification_code(db, user)
    send_verification_email(user, code.code)

    return SignupResponse(
        message="If this email is not registered, you will receive a verification code.",
        email=user.email,
        requires_verification=True
    )


@router.post("/verify-email", response_model=VerificationResponse)
def verify_email(body: VerifyEmailIn, db: Session = Depends(get_db)):
    """
    Verify user's email with the 6-digit code.
    """
    user = db.scalar(select(User).where(User.email == body.email))
    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    if user.email_verified:
        return VerificationResponse(
            message="Email already verified",
            requires_onboarding=not user.onboarding_completed
        )

    success, message = verify_code(db, user, body.code)
    if not success:
        raise HTTPException(status_code=400, detail=message)

    return VerificationResponse(
        message=message,
        requires_onboarding=True
    )


@router.post("/resend-code", response_model=VerificationResponse)
def resend_verification_code(body: ResendCodeIn, db: Session = Depends(get_db)):
    """
    Resend verification code to user's email.
    Rate limited to prevent abuse.
    """
    user = db.scalar(select(User).where(User.email == body.email))
    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    if user.email_verified:
        return VerificationResponse(message="Email already verified")

    # Rate limiting
    recent_count = count_recent_codes(db, user.id, hours=1)
    if recent_count >= settings.MAX_RESEND_PER_HOUR:
        raise HTTPException(
            status_code=429,
            detail="Too many requests. Please wait before requesting another code."
        )

    # Create and send new code
    code = create_verification_code(db, user)
    send_verification_email(user, code.code)

    return VerificationResponse(
        message="Verification code sent! Check your email."
    )


@router.post("/login")
def login(body: LoginIn, db: Session = Depends(get_db)):
    """
    Login user. Requires verified email.
    Rate limited to prevent brute force attacks.
    """
    # Check if blocked due to too many attempts
    if login_rate_limiter.is_blocked(body.email):
        raise HTTPException(
            status_code=429,
            detail="Too many failed login attempts. Please try again in 15 minutes."
        )

    user = db.scalar(select(User).where(User.email == body.email))
    if not user or not verify_password(body.password, user.password_hash):
        # Record failed attempt
        login_rate_limiter.record_attempt(body.email)
        remaining = login_rate_limiter.get_remaining_attempts(body.email)
        raise HTTPException(
            status_code=401,
            detail=f"Invalid credentials. {remaining} attempts remaining."
        )

    if not user.email_verified:
        raise HTTPException(
            status_code=403,
            detail="Please verify your email before logging in"
        )

    # Reset rate limiter on successful login
    login_rate_limiter.reset(body.email)

    return _user_out(user)


@router.get("/me")
def get_me(current_user: User = Depends(get_current_user)):
    """Get current authenticated user info."""
    return {
        "user": {
            "id": current_user.id,
            "name": getattr(current_user, "name", None),
            "email": current_user.email,
            "email_verified": current_user.email_verified,
            "onboarding_completed": current_user.onboarding_completed,
            "created_at": current_user.created_at.isoformat() if current_user.created_at else None,
        }
    }


@router.delete("/me", status_code=204)
def delete_my_account(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    """Permanently delete the authenticated user and all their owned data.

    Cascades to recipes, tags, meal_plan_entries, shopping_lists,
    verification_codes, preferences, and saved_recipes via the
    User model's relationship config.
    """
    db.delete(current_user)
    db.commit()
    return None


@router.post("/refresh")
def refresh_token(refresh_token: str, db: Session = Depends(get_db)):
    """
    Exchange a refresh token for a new access token.
    """
    payload = decode_token(refresh_token)

    if not payload:
        raise HTTPException(status_code=401, detail="Invalid refresh token")

    if payload.get("type") != "refresh":
        raise HTTPException(status_code=401, detail="Invalid token type")

    email = payload.get("sub")
    if not email:
        raise HTTPException(status_code=401, detail="Invalid refresh token")

    user = db.scalar(select(User).where(User.email == email))
    if not user:
        raise HTTPException(status_code=401, detail="User not found")

    # Return new tokens
    return {
        "access_token": create_access_token(user.email),
        "refresh_token": create_refresh_token(user.email),
        "token_type": "bearer",
        "expires_in": 900
    }


@router.post("/logout")
def logout(
    current_user: User = Depends(get_current_user),
    creds: HTTPAuthorizationCredentials = Depends(HTTPBearer()),
):
    """
    Logout user by blacklisting their current access token.
    """
    token = creds.credentials
    blacklist_token(token)

    return {"message": "Successfully logged out"}


@router.post("/forgot-password", response_model=PasswordResetResponse)
def forgot_password(body: ForgotPasswordIn, db: Session = Depends(get_db)):
    """
    Request a password reset code.
    Uses silent success pattern to prevent email enumeration.
    """
    user = db.scalar(select(User).where(User.email == body.email))

    if user:
        # Rate limiting - max 3 codes per hour
        recent_count = count_recent_codes(db, user.id, hours=1)
        if recent_count < 3:
            code = create_verification_code(db, user)
            send_password_reset_email(user, code.code)

    # Always return success to prevent email enumeration
    return PasswordResetResponse(
        message="If this email exists in our system, you will receive a password reset code."
    )


@router.post("/reset-password", response_model=PasswordResetResponse)
def reset_password(body: ResetPasswordIn, db: Session = Depends(get_db)):
    """
    Reset password using verification code.
    """
    user = db.scalar(select(User).where(User.email == body.email))
    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    # Verify the code (don't mark email as verified)
    success, message = verify_code(db, user, body.code, mark_verified=False)
    if not success:
        raise HTTPException(status_code=400, detail=message)

    # Update password
    user.password_hash = hash_password(body.new_password)
    db.commit()

    return PasswordResetResponse(message="Password reset successfully! You can now sign in.")
