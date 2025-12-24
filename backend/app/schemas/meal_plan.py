from pydantic import BaseModel, Field
from datetime import date, datetime


class MealPlanOut(BaseModel):
    """Simple meal plan output for JSON storage"""
    plan: dict = Field(default_factory=dict)

    class Config:
        from_attributes = True


class MealPlanEntryCreate(BaseModel):
    week_start_date: date
    day_of_week: int = Field(ge=0, le=6, description="0=Monday, 6=Sunday")
    meal_slot: str = Field(description="breakfast, lunch, dinner, or snack")
    recipe_id: int


class MealPlanEntryUpdate(BaseModel):
    recipe_id: int | None = None


class MealPlanEntryOut(BaseModel):
    id: int
    user_id: int
    week_start_date: date
    day_of_week: int
    meal_slot: str
    recipe_id: int
    created_at: datetime

    class Config:
        from_attributes = True


class MealPlanEntryWithRecipe(MealPlanEntryOut):
    """Meal plan entry with recipe details included"""
    recipe_title: str | None = None
    recipe_image_url: str | None = None


class WeeklyMealPlanRequest(BaseModel):
    """Request to get meal plan for a specific week"""
    week_start_date: date


class WeeklyMealPlanOut(BaseModel):
    """Weekly meal plan organized by day and meal slot"""
    week_start_date: date
    entries: list[MealPlanEntryOut] = []
