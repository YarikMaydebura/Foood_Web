from sqlalchemy.orm import Session, joinedload
from sqlalchemy import select, func
from datetime import date

from app.models.meal_plan import MealPlanEntry


SLOT_CAP = 5


def get_weekly_meal_plan(db: Session, user_id: int, week_start_date: date) -> list[MealPlanEntry]:
    """Return all meal plan entries for a week, ordered by day/slot/position."""
    return list(db.scalars(
        select(MealPlanEntry)
        .where(
            MealPlanEntry.user_id == user_id,
            MealPlanEntry.week_start_date == week_start_date,
        )
        .options(joinedload(MealPlanEntry.recipe))
        .order_by(
            MealPlanEntry.day_of_week,
            MealPlanEntry.meal_slot,
            MealPlanEntry.position,
            MealPlanEntry.id,
        )
    ))


def get_meal_plan_entry(db: Session, entry_id: int) -> MealPlanEntry | None:
    return db.scalar(
        select(MealPlanEntry)
        .where(MealPlanEntry.id == entry_id)
        .options(joinedload(MealPlanEntry.recipe))
    )


def count_entries_in_slot(
    db: Session,
    user_id: int,
    week_start_date: date,
    day_of_week: int,
    meal_slot: str,
) -> int:
    return db.scalar(
        select(func.count())
        .select_from(MealPlanEntry)
        .where(
            MealPlanEntry.user_id == user_id,
            MealPlanEntry.week_start_date == week_start_date,
            MealPlanEntry.day_of_week == day_of_week,
            MealPlanEntry.meal_slot == meal_slot,
        )
    ) or 0


def _next_position(
    db: Session,
    user_id: int,
    week_start_date: date,
    day_of_week: int,
    meal_slot: str,
) -> int:
    current_max = db.scalar(
        select(func.max(MealPlanEntry.position))
        .where(
            MealPlanEntry.user_id == user_id,
            MealPlanEntry.week_start_date == week_start_date,
            MealPlanEntry.day_of_week == day_of_week,
            MealPlanEntry.meal_slot == meal_slot,
        )
    )
    return 0 if current_max is None else current_max + 1


def add_meal_plan_entry(
    db: Session,
    user_id: int,
    week_start_date: date,
    day_of_week: int,
    meal_slot: str,
    recipe_id: int,
) -> MealPlanEntry:
    """Append a recipe to a slot. Caller is responsible for enforcing SLOT_CAP."""
    entry = MealPlanEntry(
        user_id=user_id,
        week_start_date=week_start_date,
        day_of_week=day_of_week,
        meal_slot=meal_slot,
        recipe_id=recipe_id,
        position=_next_position(db, user_id, week_start_date, day_of_week, meal_slot),
    )
    db.add(entry)
    db.commit()
    db.refresh(entry)
    return entry


def delete_meal_plan_entry(db: Session, entry: MealPlanEntry) -> None:
    db.delete(entry)
    db.commit()


def delete_meal_plan_entries_in_slot(
    db: Session,
    user_id: int,
    week_start_date: date,
    day_of_week: int,
    meal_slot: str,
) -> int:
    """Delete every dish in a slot. Returns the number of deleted rows."""
    entries = list(db.scalars(
        select(MealPlanEntry).where(
            MealPlanEntry.user_id == user_id,
            MealPlanEntry.week_start_date == week_start_date,
            MealPlanEntry.day_of_week == day_of_week,
            MealPlanEntry.meal_slot == meal_slot,
        )
    ))
    for entry in entries:
        db.delete(entry)
    db.commit()
    return len(entries)


def clear_weekly_meal_plan(db: Session, user_id: int, week_start_date: date) -> int:
    """Clear all meal plan entries for a week. Returns count of deleted entries."""
    entries = get_weekly_meal_plan(db, user_id, week_start_date)
    count = len(entries)
    for entry in entries:
        db.delete(entry)
    db.commit()
    return count
