from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from datetime import date

from app.api.deps import get_db, get_current_user
from app.models.user import User
from app.schemas.meal_plan import (
    MealPlanEntryCreate,
    MealPlanEntryOut,
    WeeklyMealPlanOut,
)
from app.crud import meal_plan as crud_meal

router = APIRouter(prefix="/meal-plan", tags=["meal-plan"])


@router.get("/week/{week_start_date}", response_model=WeeklyMealPlanOut)
def get_weekly_meal_plan(
    week_start_date: date,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Get meal plan for a specific week"""
    entries = crud_meal.get_weekly_meal_plan(db, current_user.id, week_start_date)
    return WeeklyMealPlanOut(week_start_date=week_start_date, entries=entries)


@router.post("", response_model=MealPlanEntryOut, status_code=201)
def create_meal_plan_entry(
    body: MealPlanEntryCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Create or update a meal plan entry for a specific slot"""
    return crud_meal.upsert_meal_plan_entry(
        db,
        user_id=current_user.id,
        week_start_date=body.week_start_date,
        day_of_week=body.day_of_week,
        meal_slot=body.meal_slot,
        recipe_id=body.recipe_id,
    )


@router.delete("/{entry_id}")
def delete_meal_plan_entry(
    entry_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Delete a meal plan entry"""
    entry = crud_meal.get_meal_plan_entry(db, entry_id)
    if not entry or entry.user_id != current_user.id:
        raise HTTPException(status_code=404, detail="Meal plan entry not found")
    crud_meal.delete_meal_plan_entry(db, entry)
    return {"ok": True}


@router.delete("/week/{week_start_date}")
def clear_weekly_meal_plan(
    week_start_date: date,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Clear all meal plan entries for a specific week"""
    count = crud_meal.clear_weekly_meal_plan(db, current_user.id, week_start_date)
    return {"ok": True, "deleted_count": count}


@router.delete("/slot")
def delete_meal_plan_slot(
    week_start_date: date,
    day_of_week: int,
    meal_slot: str,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Delete a specific meal slot"""
    deleted = crud_meal.delete_meal_plan_entry_by_slot(
        db, current_user.id, week_start_date, day_of_week, meal_slot
    )
    if not deleted:
        raise HTTPException(status_code=404, detail="Meal plan entry not found")
    return {"ok": True}
