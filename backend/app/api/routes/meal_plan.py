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


@router.get("")
def get_current_meal_plan(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Get current week's meal plan in frontend format"""
    from datetime import datetime, timedelta

    # Get the start of current week (Monday)
    today = datetime.now().date()
    week_start = today - timedelta(days=today.weekday())

    # Get entries from database
    entries = crud_meal.get_weekly_meal_plan(db, current_user.id, week_start)

    # Convert to frontend format: {Monday: {Breakfast: recipe_id}}
    days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    meals = ["Breakfast", "Lunch", "Dinner"]

    plan = {}
    for entry in entries:
        day = days[entry.day_of_week]
        if day not in plan:
            plan[day] = {}
        plan[day][entry.meal_slot] = entry.recipe_id

    return plan


@router.put("")
def update_current_meal_plan(
    plan: dict,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Update current week's meal plan from frontend format"""
    from datetime import datetime, timedelta

    # Get the start of current week (Monday)
    today = datetime.now().date()
    week_start = today - timedelta(days=today.weekday())

    # Clear existing entries for this week
    crud_meal.clear_weekly_meal_plan(db, current_user.id, week_start)

    # Convert frontend format to database entries
    days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    for day, meals in plan.items():
        day_index = days.index(day)
        for meal_slot, recipe_id in meals.items():
            crud_meal.upsert_meal_plan_entry(
                db,
                user_id=current_user.id,
                week_start_date=week_start,
                day_of_week=day_index,
                meal_slot=meal_slot,
                recipe_id=recipe_id,
            )

    return {"ok": True}


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
