from pydantic import BaseModel, EmailStr, Field


class VerifyEmailIn(BaseModel):
    email: EmailStr
    code: str = Field(min_length=6, max_length=6, pattern=r"^\d{6}$")


class ResendCodeIn(BaseModel):
    email: EmailStr


class VerificationResponse(BaseModel):
    message: str
    requires_onboarding: bool = False


class SignupResponse(BaseModel):
    message: str
    email: str
    requires_verification: bool = True
