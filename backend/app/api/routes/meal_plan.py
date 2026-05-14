from datetime import datetime, timedelta, date
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.api.deps import get_db, get_current_user
from app.models.user import User
from app.schemas.meal_plan import (
    MealPlanEntryCreate,
    MealPlanEntryOut,
    WeeklyMealPlanOut,
)
from app.crud import meal_plan as crud_meal
from app.crud.meal_plan import SLOT_CAP


router = APIRouter(prefix="/meal-plan", tags=["meal-plan"])


def _current_week_start() -> date:
    today = datetime.now().date()
    return today - timedelta(days=today.weekday())


def _entries_to_nested(entries) -> dict[str, dict[str, list[int]]]:
    """Group entries into {Day: {MealSlot: [recipe_id, ...]}} preserving position order.

    `entries` is assumed to be pre-sorted by (day_of_week, meal_slot, position).
    """
    days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    plan: dict[str, dict[str, list[int]]] = {}
    for entry in entries:
        day = days[entry.day_of_week]
        if day not in plan:
            plan[day] = {}
        plan[day].setdefault(entry.meal_slot, []).append(entry.recipe_id)
    return plan


@router.get("")
def get_current_meal_plan(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    """Return current week's meal plan as {Day: {MealSlot: [recipe_id, ...]}}."""
    entries = crud_meal.get_weekly_meal_plan(db, current_user.id, _current_week_start())
    return _entries_to_nested(entries)


@router.put("")
def update_current_meal_plan(
    plan: dict,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    """Replace current week's meal plan from {Day: {MealSlot: [recipe_id, ...] | recipe_id}}.

    Accepts both a list of recipe_ids per slot (new format) and a single
    recipe_id per slot (legacy format) for backward compat. Each slot is
    capped at SLOT_CAP recipes; extra entries are silently truncated.
    """
    week_start = _current_week_start()
    crud_meal.clear_weekly_meal_plan(db, current_user.id, week_start)

    days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    for day, meals in plan.items():
        if day not in days or not isinstance(meals, dict):
            continue
        day_index = days.index(day)
        for meal_slot, value in meals.items():
            if value is None:
                continue
            recipe_ids = value if isinstance(value, list) else [value]
            for recipe_id in recipe_ids[:SLOT_CAP]:
                crud_meal.add_meal_plan_entry(
                    db,
                    user_id=current_user.id,
                    week_start_date=week_start,
                    day_of_week=day_index,
                    meal_slot=meal_slot,
                    recipe_id=int(recipe_id),
                )

    return {"ok": True}


@router.get("/week/{week_start_date}", response_model=WeeklyMealPlanOut)
def get_weekly_meal_plan(
    week_start_date: date,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    entries = crud_meal.get_weekly_meal_plan(db, current_user.id, week_start_date)
    return WeeklyMealPlanOut(week_start_date=week_start_date, entries=entries)


@router.post("", response_model=MealPlanEntryOut, status_code=201)
def create_meal_plan_entry(
    body: MealPlanEntryCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    """Append a recipe to a meal slot. Slot is capped at SLOT_CAP recipes."""
    count = crud_meal.count_entries_in_slot(
        db,
        user_id=current_user.id,
        week_start_date=body.week_start_date,
        day_of_week=body.day_of_week,
        meal_slot=body.meal_slot,
    )
    if count >= SLOT_CAP:
        raise HTTPException(
            status_code=400,
            detail=f"Slot already has {SLOT_CAP} recipes. Remove one before adding another.",
        )
    return crud_meal.add_meal_plan_entry(
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
    current_user: User = Depends(get_current_user),
):
    entry = crud_meal.get_meal_plan_entry(db, entry_id)
    if not entry or entry.user_id != current_user.id:
        raise HTTPException(status_code=404, detail="Meal plan entry not found")
    crud_meal.delete_meal_plan_entry(db, entry)
    return {"ok": True}


@router.delete("/week/{week_start_date}")
def clear_weekly_meal_plan(
    week_start_date: date,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    count = crud_meal.clear_weekly_meal_plan(db, current_user.id, week_start_date)
    return {"ok": True, "deleted_count": count}


@router.delete("/slot")
def delete_meal_plan_slot(
    week_start_date: date,
    day_of_week: int,
    meal_slot: str,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    """Delete every dish in a specific slot."""
    deleted = crud_meal.delete_meal_plan_entries_in_slot(
        db, current_user.id, week_start_date, day_of_week, meal_slot
    )
    if not deleted:
        raise HTTPException(status_code=404, detail="No entries in that slot")
    return {"ok": True, "deleted_count": deleted}
