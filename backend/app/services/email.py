"""
Email service using Resend for sending verification codes.
"""
import secrets
from datetime import datetime, timedelta, timezone
from sqlalchemy.orm import Session
from sqlalchemy import select, func

from app.core.config import settings
from app.models.email_verification import EmailVerificationCode
from app.models.user import User

# Initialize Resend if API key is configured
RESEND_AVAILABLE = False
resend = None

if settings.RESEND_API_KEY:
    try:
        import resend as resend_module
        resend_module.api_key = settings.RESEND_API_KEY
        resend = resend_module
        RESEND_AVAILABLE = True
    except ImportError:
        pass


def generate_verification_code() -> str:
    """Generate a cryptographically secure 6-digit code."""
    return "".join([str(secrets.randbelow(10)) for _ in range(6)])


def create_verification_code(db: Session, user: User) -> EmailVerificationCode:
    """Create a new verification code for a user, invalidating any existing ones."""
    # Delete any existing codes for this user
    db.query(EmailVerificationCode).filter(
        EmailVerificationCode.user_id == user.id
    ).delete()

    # Create new code
    code = EmailVerificationCode(
        user_id=user.id,
        code=generate_verification_code(),
        expires_at=datetime.now(timezone.utc) + timedelta(
            minutes=settings.VERIFICATION_CODE_EXPIRY_MINUTES
        )
    )
    db.add(code)
    db.commit()
    db.refresh(code)
    return code


def get_active_verification_code(db: Session, user_id: int) -> EmailVerificationCode | None:
    """Get the active (non-expired) verification code for a user."""
    return db.scalar(
        select(EmailVerificationCode)
        .where(
            EmailVerificationCode.user_id == user_id,
            EmailVerificationCode.expires_at > datetime.now(timezone.utc)
        )
    )


def count_recent_codes(db: Session, user_id: int, hours: int = 1) -> int:
    """Count verification codes created in the last N hours for rate limiting."""
    cutoff = datetime.now(timezone.utc) - timedelta(hours=hours)
    return db.scalar(
        select(func.count())
        .select_from(EmailVerificationCode)
        .where(
            EmailVerificationCode.user_id == user_id,
            EmailVerificationCode.created_at > cutoff
        )
    ) or 0


def send_verification_email(user: User, code: str) -> bool:
    """
    Send verification email via Resend.
    Returns True if sent successfully, False otherwise.
    Falls back to logging in development if Resend is not configured.
    """
    if not RESEND_AVAILABLE:
        # Development fallback - print the code to console
        print(f"[DEV] Verification code for {user.email}: {code}")
        return True

    html_content = f"""
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="margin: 0; padding: 0; background-color: #f9fafb; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color: #f9fafb;">
            <tr>
                <td align="center" style="padding: 40px 20px;">
                    <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="max-width: 500px; background-color: #ffffff; border-radius: 16px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);">

                        <!-- Header with Logo -->
                        <tr>
                            <td style="padding: 40px 40px 20px 40px; text-align: center;">
                                <div style="display: inline-block; background: linear-gradient(135deg, #10b981 0%, #059669 100%); padding: 16px 24px; border-radius: 12px;">
                                    <span style="font-size: 32px; font-weight: bold; color: #ffffff; letter-spacing: -1px;">Foood</span>
                                </div>
                            </td>
                        </tr>

                        <!-- Welcome Message -->
                        <tr>
                            <td style="padding: 20px 40px 10px 40px; text-align: center;">
                                <h1 style="margin: 0; font-size: 24px; font-weight: 600; color: #111827;">
                                    Welcome, {user.name}!
                                </h1>
                            </td>
                        </tr>

                        <!-- Subtitle -->
                        <tr>
                            <td style="padding: 10px 40px 30px 40px; text-align: center;">
                                <p style="margin: 0; font-size: 16px; color: #6b7280; line-height: 1.5;">
                                    Enter this verification code to complete your registration
                                </p>
                            </td>
                        </tr>

                        <!-- Verification Code Box -->
                        <tr>
                            <td style="padding: 0 40px 30px 40px;">
                                <div style="background: linear-gradient(135deg, #f0fdf4 0%, #ecfdf5 100%); border: 2px solid #10b981; border-radius: 12px; padding: 24px; text-align: center;">
                                    <p style="margin: 0 0 8px 0; font-size: 12px; color: #059669; text-transform: uppercase; letter-spacing: 2px; font-weight: 600;">
                                        Your Verification Code
                                    </p>
                                    <p style="margin: 0; font-size: 36px; font-weight: 700; color: #059669; letter-spacing: 8px; font-family: 'Courier New', monospace;">
                                        {code}
                                    </p>
                                </div>
                            </td>
                        </tr>

                        <!-- Timer Warning -->
                        <tr>
                            <td style="padding: 0 40px 30px 40px; text-align: center;">
                                <div style="display: inline-block; background-color: #fef3c7; padding: 12px 20px; border-radius: 8px;">
                                    <span style="font-size: 14px; color: #92400e;">
                                        ⏱️ This code expires in <strong>{settings.VERIFICATION_CODE_EXPIRY_MINUTES} minutes</strong>
                                    </span>
                                </div>
                            </td>
                        </tr>

                        <!-- Divider -->
                        <tr>
                            <td style="padding: 0 40px;">
                                <div style="height: 1px; background-color: #e5e7eb;"></div>
                            </td>
                        </tr>

                        <!-- Footer -->
                        <tr>
                            <td style="padding: 30px 40px 40px 40px; text-align: center;">
                                <p style="margin: 0 0 16px 0; font-size: 13px; color: #9ca3af; line-height: 1.5;">
                                    If you didn't create an account with Foood, you can safely ignore this email.
                                </p>
                                <p style="margin: 0; font-size: 13px; color: #9ca3af;">
                                    © 2025 Foood. All rights reserved.
                                </p>
                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>
    </body>
    </html>
    """

    try:
        resend.Emails.send({
            "from": settings.FROM_EMAIL,
            "to": [user.email],
            "subject": "🍳 Verify your Foood account",
            "html": html_content
        })
        return True
    except Exception as e:
        print(f"Failed to send verification email: {e}")
        return False


def verify_code(db: Session, user: User, code: str) -> tuple[bool, str]:
    """
    Verify a code for a user.
    Returns (success, message) tuple.
    """
    verification = get_active_verification_code(db, user.id)

    if not verification:
        return False, "No active verification code. Please request a new one."

    if verification.attempts >= settings.MAX_VERIFICATION_ATTEMPTS:
        return False, "Too many failed attempts. Please request a new code."

    if verification.code != code:
        verification.attempts += 1
        db.commit()
        remaining = settings.MAX_VERIFICATION_ATTEMPTS - verification.attempts
        return False, f"Invalid code. {remaining} attempts remaining."

    # Success - mark user as verified and delete the code
    user.email_verified = True
    db.delete(verification)
    db.commit()

    return True, "Email verified successfully!"
