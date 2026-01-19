from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    DATABASE_URL: str
    JWT_SECRET: str
    JWT_EXPIRE_MINUTES: int = 60
    CORS_ORIGINS: str = "http://localhost:5173"

    # Email verification settings (Resend)
    RESEND_API_KEY: str = ""
    FROM_EMAIL: str = "Foood <onboarding@resend.dev>"

    # Verification code settings
    VERIFICATION_CODE_EXPIRY_MINUTES: int = 15
    MAX_VERIFICATION_ATTEMPTS: int = 5
    MAX_RESEND_PER_HOUR: int = 3

    class Config:
        env_file = ".env"

settings = Settings()
