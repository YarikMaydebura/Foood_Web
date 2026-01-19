from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import select

from app.api.deps import get_db, get_current_user
from app.models.user import User
from app.schemas.auth import LoginIn, RegisterIn
from app.schemas.verification import (
    VerifyEmailIn, ResendCodeIn, VerificationResponse, SignupResponse
)
from app.core.security import verify_password, hash_password, create_access_token
from app.core.config import settings
from app.services.email import (
    create_verification_code, send_verification_email,
    verify_code, count_recent_codes
)

router = APIRouter(prefix="/auth", tags=["auth"])


def _user_out(user: User) -> dict:
    """Generate auth response with JWT token."""
    access_token = create_access_token(user.email)
    return {
        "user": {
            "id": user.id,
            "name": getattr(user, "name", None),
            "email": user.email,
            "email_verified": user.email_verified,
            "onboarding_completed": user.onboarding_completed
        },
        "access_token": access_token
    }


@router.post("/signup", response_model=SignupResponse)
def signup(body: RegisterIn, db: Session = Depends(get_db)):
    """
    Register a new user.
    Creates an unverified user and sends a verification code.
    """
    exists = db.scalar(select(User).where(User.email == body.email))
    if exists:
        raise HTTPException(status_code=400, detail="Email already registered")

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
        message="Account created! Please check your email for a verification code.",
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
    """
    user = db.scalar(select(User).where(User.email == body.email))
    if not user or not verify_password(body.password, user.password_hash):
        raise HTTPException(status_code=401, detail="Invalid credentials")

    if not user.email_verified:
        raise HTTPException(
            status_code=403,
            detail="Please verify your email before logging in"
        )

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
            "onboarding_completed": current_user.onboarding_completed
        }
    }
