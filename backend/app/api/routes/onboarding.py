from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.api.deps import get_db, get_current_user
from app.models.user import User
from app.schemas.onboarding import (
    OnboardingSurveyIn, OnboardingResponse, OnboardingStatusOut, OnboardingOptionsOut
)
from app.services.onboarding import complete_onboarding, skip_onboarding, DIET_TAGS, CUISINE_TAGS

router = APIRouter(prefix="/onboarding", tags=["onboarding"])


@router.get("/status", response_model=OnboardingStatusOut)
def get_onboarding_status(current_user: User = Depends(get_current_user)):
    """Get the user's onboarding status."""
    return OnboardingStatusOut(
        onboarding_completed=current_user.onboarding_completed,
        email_verified=current_user.email_verified
    )


@router.get("/options", response_model=OnboardingOptionsOut)
def get_onboarding_options():
    """Get available options for the onboarding survey."""
    return OnboardingOptionsOut(
        diet_options=DIET_TAGS,
        cuisine_options=CUISINE_TAGS
    )


@router.post("/complete", response_model=OnboardingResponse)
def submit_onboarding_survey(
    body: OnboardingSurveyIn,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """
    Submit onboarding survey and get personalized recipes.
    """
    if not current_user.email_verified:
        raise HTTPException(
            status_code=403,
            detail="Please verify your email before completing onboarding"
        )

    if current_user.onboarding_completed:
        raise HTTPException(
            status_code=400,
            detail="Onboarding already completed"
        )

    recipes_count = complete_onboarding(
        db=db,
        user=current_user,
        diet_preferences=list(body.diet_preferences),
        cuisine_preferences=list(body.cuisine_preferences),
        recipe_limit=10
    )

    return OnboardingResponse(
        message="Onboarding complete! Your personalized recipes are ready.",
        recipes_assigned=recipes_count
    )


@router.post("/skip", response_model=OnboardingResponse)
def skip_onboarding_survey(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """
    Skip the onboarding survey and get random starter recipes.
    """
    if not current_user.email_verified:
        raise HTTPException(
            status_code=403,
            detail="Please verify your email before continuing"
        )

    if current_user.onboarding_completed:
        raise HTTPException(
            status_code=400,
            detail="Onboarding already completed"
        )

    recipes_count = skip_onboarding(db, current_user, recipe_limit=10)

    return OnboardingResponse(
        message="Got it! We've added some starter recipes for you.",
        recipes_assigned=recipes_count
    )
