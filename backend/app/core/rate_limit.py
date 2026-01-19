"""
Simple in-memory rate limiting for login attempts.
For production, consider using Redis-backed rate limiting.
"""
from datetime import datetime, timedelta
from collections import defaultdict
import threading


class LoginRateLimiter:
    """
    Rate limiter for login attempts.
    Tracks failed attempts by email and blocks after max attempts.
    """

    def __init__(self, max_attempts: int = 5, window_minutes: int = 15):
        self.max_attempts = max_attempts
        self.window = timedelta(minutes=window_minutes)
        self._attempts: dict[str, list[datetime]] = defaultdict(list)
        self._lock = threading.Lock()

    def _cleanup_old_attempts(self, email: str) -> None:
        """Remove attempts older than the window."""
        cutoff = datetime.utcnow() - self.window
        self._attempts[email] = [
            t for t in self._attempts[email] if t > cutoff
        ]

    def is_blocked(self, email: str) -> bool:
        """Check if an email is blocked due to too many attempts."""
        with self._lock:
            self._cleanup_old_attempts(email)
            return len(self._attempts[email]) >= self.max_attempts

    def record_attempt(self, email: str) -> None:
        """Record a failed login attempt."""
        with self._lock:
            self._cleanup_old_attempts(email)
            self._attempts[email].append(datetime.utcnow())

    def reset(self, email: str) -> None:
        """Reset attempts for an email (call on successful login)."""
        with self._lock:
            self._attempts[email] = []

    def get_remaining_attempts(self, email: str) -> int:
        """Get remaining attempts before block."""
        with self._lock:
            self._cleanup_old_attempts(email)
            return max(0, self.max_attempts - len(self._attempts[email]))


# Global rate limiter instance
login_rate_limiter = LoginRateLimiter(max_attempts=5, window_minutes=15)
