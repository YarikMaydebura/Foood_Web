from datetime import datetime, timedelta, timezone
from passlib.context import CryptContext
from jose import jwt, JWTError
import secrets
import threading
from typing import Optional

from app.core.config import settings

pwd_context = CryptContext(
    schemes=["pbkdf2_sha256"],
    deprecated="auto",
)


class TokenBlacklist:
    """
    In-memory token blacklist for logout functionality.
    For production with multiple instances, use Redis instead.
    """

    def __init__(self):
        self._blacklist: dict[str, datetime] = {}
        self._lock = threading.Lock()

    def add(self, token: str, expires_at: datetime) -> None:
        """Add a token to the blacklist."""
        with self._lock:
            self._blacklist[token] = expires_at
            self._cleanup()

    def is_blacklisted(self, token: str) -> bool:
        """Check if a token is blacklisted."""
        with self._lock:
            return token in self._blacklist

    def _cleanup(self) -> None:
        """Remove expired tokens from blacklist."""
        now = datetime.now(timezone.utc)
        self._blacklist = {
            token: exp for token, exp in self._blacklist.items()
            if exp > now
        }


# Global token blacklist instance
token_blacklist = TokenBlacklist()


def hash_password(password: str) -> str:
    return pwd_context.hash(password)


def verify_password(password: str, password_hash: str) -> bool:
    return pwd_context.verify(password, password_hash)


def create_access_token(email: str) -> str:
    """Create short-lived JWT access token (15 minutes)."""
    expire = datetime.now(timezone.utc) + timedelta(minutes=15)
    payload = {
        "sub": email,
        "exp": expire,
        "type": "access",
    }
    return jwt.encode(payload, settings.JWT_SECRET, algorithm="HS256")


def create_refresh_token(email: str) -> str:
    """Create long-lived refresh token (7 days)."""
    expire = datetime.now(timezone.utc) + timedelta(days=7)
    payload = {
        "sub": email,
        "exp": expire,
        "type": "refresh",
        "jti": secrets.token_urlsafe(16),  # Unique token ID for blacklisting
    }
    return jwt.encode(payload, settings.JWT_SECRET, algorithm="HS256")


def decode_token(token: str) -> Optional[dict]:
    """Decode and validate a JWT token."""
    try:
        payload = jwt.decode(token, settings.JWT_SECRET, algorithms=["HS256"])
        return payload
    except JWTError:
        return None


def blacklist_token(token: str) -> None:
    """Add a token to the blacklist (for logout)."""
    payload = decode_token(token)
    if payload and "exp" in payload:
        exp = datetime.fromtimestamp(payload["exp"], tz=timezone.utc)
        token_blacklist.add(token, exp)


def is_token_blacklisted(token: str) -> bool:
    """Check if a token has been blacklisted."""
    return token_blacklist.is_blacklisted(token)
