from sqlalchemy.orm import Session, joinedload
from sqlalchemy import select, and_
from datetime import date
from app.models.meal_plan import MealPlanEntry
from app.models.recipe import Recipe


def get_weekly_meal_plan(db: Session, user_id: int, week_start_date: date) -> list[MealPlanEntry]:
    """Get all meal plan entries for a specific week"""
    return list(db.scalars(
        select(MealPlanEntry)
        .where(
            MealPlanEntry.user_id == user_id,
            MealPlanEntry.week_start_date == week_start_date
        )
        .options(joinedload(MealPlanEntry.recipe))
        .order_by(MealPlanEntry.day_of_week, MealPlanEntry.meal_slot)
    ))


def get_meal_plan_entry(db: Session, entry_id: int) -> MealPlanEntry | None:
    return db.scalar(
        select(MealPlanEntry)
        .where(MealPlanEntry.id == entry_id)
        .options(joinedload(MealPlanEntry.recipe))
    )


def get_meal_plan_entry_by_slot(
    db: Session,
    user_id: int,
    week_start_date: date,
    day_of_week: int,
    meal_slot: str
) -> MealPlanEntry | None:
    """Get specific meal plan entry by slot"""
    return db.scalar(
        select(MealPlanEntry)
        .where(
            MealPlanEntry.user_id == user_id,
            MealPlanEntry.week_start_date == week_start_date,
            MealPlanEntry.day_of_week == day_of_week,
            MealPlanEntry.meal_slot == meal_slot
        )
    )


def create_meal_plan_entry(
    db: Session,
    user_id: int,
    week_start_date: date,
    day_of_week: int,
    meal_slot: str,
    recipe_id: int
) -> MealPlanEntry:
    entry = MealPlanEntry(
        user_id=user_id,
        week_start_date=week_start_date,
        day_of_week=day_of_week,
        meal_slot=meal_slot,
        recipe_id=recipe_id
    )
    db.add(entry)
    db.commit()
    db.refresh(entry)
    return entry


def upsert_meal_plan_entry(
    db: Session,
    user_id: int,
    week_start_date: date,
    day_of_week: int,
    meal_slot: str,
    recipe_id: int
) -> MealPlanEntry:
    """Create or update meal plan entry for a specific slot"""
    existing = get_meal_plan_entry_by_slot(db, user_id, week_start_date, day_of_week, meal_slot)

    if existing:
        existing.recipe_id = recipe_id
        db.commit()
        db.refresh(existing)
        return existing
    else:
        return create_meal_plan_entry(db, user_id, week_start_date, day_of_week, meal_slot, recipe_id)


def delete_meal_plan_entry(db: Session, entry: MealPlanEntry) -> None:
    db.delete(entry)
    db.commit()


def delete_meal_plan_entry_by_slot(
    db: Session,
    user_id: int,
    week_start_date: date,
    day_of_week: int,
    meal_slot: str
) -> bool:
    """Delete meal plan entry by slot, returns True if deleted"""
    entry = get_meal_plan_entry_by_slot(db, user_id, week_start_date, day_of_week, meal_slot)
    if entry:
        db.delete(entry)
        db.commit()
        return True
    return False


def clear_weekly_meal_plan(db: Session, user_id: int, week_start_date: date) -> int:
    """Clear all meal plan entries for a week, returns count of deleted entries"""
    entries = get_weekly_meal_plan(db, user_id, week_start_date)
    count = len(entries)
    for entry in entries:
        db.delete(entry)
    db.commit()
    return count
