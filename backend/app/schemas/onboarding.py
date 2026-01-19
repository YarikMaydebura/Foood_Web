from pydantic import BaseModel, Field
from typing import Literal


class OnboardingSurveyIn(BaseModel):
    diet_preferences: list[Literal["Vegetarian", "Healthy", "Comfort Food"]] = Field(
        default_factory=list,
        max_length=3,
        description="User's dietary preferences"
    )
    cuisine_preferences: list[Literal[
        "Italian", "Asian", "Mediterranean", "American", "Japanese", "French", "Thai"
    ]] = Field(
        default_factory=list,
        max_length=7,
        description="User's cuisine preferences"
    )


class OnboardingResponse(BaseModel):
    message: str
    recipes_assigned: int


class OnboardingStatusOut(BaseModel):
    onboarding_completed: bool
    email_verified: bool


class OnboardingOptionsOut(BaseModel):
    diet_options: list[str]
    cuisine_options: list[str]
