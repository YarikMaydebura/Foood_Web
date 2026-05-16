from sqlalchemy.orm import Session, joinedload
from sqlalchemy import select
from datetime import date
from app.models.shopping_list import ShoppingList
from app.models.shopping_list_item import ShoppingListItem
from app.models.meal_plan import MealPlanEntry
from app.models.recipe_ingredient import RecipeIngredient
from app.crud.ingredient import get_ingredient


def get_shopping_list(db: Session, shopping_list_id: int) -> ShoppingList | None:
    return db.scalar(
        select(ShoppingList)
        .where(ShoppingList.id == shopping_list_id)
        .options(
            joinedload(ShoppingList.items).joinedload(ShoppingListItem.ingredient)
        )
    )


def get_shopping_list_by_week(db: Session, user_id: int, week_start_date: date) -> ShoppingList | None:
    return db.scalar(
        select(ShoppingList)
        .where(
            ShoppingList.user_id == user_id,
            ShoppingList.week_start_date == week_start_date
        )
        .options(
            joinedload(ShoppingList.items).joinedload(ShoppingListItem.ingredient)
        )
    )


def list_shopping_lists_by_user(db: Session, user_id: int) -> list[ShoppingList]:
    return list(db.scalars(
        select(ShoppingList)
        .where(ShoppingList.user_id == user_id)
        .order_by(ShoppingList.week_start_date.desc())
    ))


def create_shopping_list(db: Session, user_id: int, week_start_date: date) -> ShoppingList:
    shopping_list = ShoppingList(user_id=user_id, week_start_date=week_start_date)
    db.add(shopping_list)
    db.commit()
    db.refresh(shopping_list)
    return shopping_list


def generate_shopping_list_from_meal_plan(
    db: Session, user_id: int, week_start_date: date
) -> ShoppingList:
    """Generate shopping list by aggregating ingredients from meal plan.

    Each returned item has a transient `day_quantities` attribute (dict
    mapping day_of_week as a string to the contributed quantity) so the
    frontend can filter the list by day range without an extra DB round trip.
    """
    shopping_list = get_shopping_list_by_week(db, user_id, week_start_date)

    if shopping_list:
        for item in shopping_list.items:
            db.delete(item)
        db.flush()
    else:
        shopping_list = ShoppingList(user_id=user_id, week_start_date=week_start_date)
        db.add(shopping_list)
        db.flush()

    meal_entries = db.scalars(
        select(MealPlanEntry)
        .where(
            MealPlanEntry.user_id == user_id,
            MealPlanEntry.week_start_date == week_start_date,
        )
    ).all()

    # Aggregate ingredients across the whole week + per-day breakdown.
    ingredient_totals: dict[int, dict] = {}
    day_quantities: dict[int, dict[int, float]] = {}

    for entry in meal_entries:
        recipe_ingredients = db.scalars(
            select(RecipeIngredient)
            .where(RecipeIngredient.recipe_id == entry.recipe_id)
        ).all()

        for ri in recipe_ingredients:
            qty = float(ri.quantity) if ri.quantity else 0.0
            if ri.ingredient_id not in ingredient_totals:
                ingredient_totals[ri.ingredient_id] = {
                    "total_quantity": 0.0,
                    "unit": ri.unit,
                }
                day_quantities[ri.ingredient_id] = {}
            ingredient_totals[ri.ingredient_id]["total_quantity"] += qty
            day_quantities[ri.ingredient_id][entry.day_of_week] = (
                day_quantities[ri.ingredient_id].get(entry.day_of_week, 0.0) + qty
            )

    for ingredient_id, data in ingredient_totals.items():
        item = ShoppingListItem(
            shopping_list_id=shopping_list.id,
            ingredient_id=ingredient_id,
            total_quantity=data["total_quantity"] if data["total_quantity"] > 0 else None,
            unit=data["unit"],
            purchased=False,
        )
        db.add(item)

    db.commit()
    db.refresh(shopping_list)

    # Attach the per-day breakdown as a transient attribute on each item so
    # Pydantic (with from_attributes=True) can serialize it without us
    # persisting a JSON column. Keys are stringified for JSON friendliness.
    for item in shopping_list.items:
        breakdown = day_quantities.get(item.ingredient_id, {})
        item.day_quantities = {str(k): v for k, v in breakdown.items()}

    return shopping_list


def delete_shopping_list(db: Session, shopping_list: ShoppingList) -> None:
    db.delete(shopping_list)
    db.commit()


# Shopping List Item operations
def get_shopping_list_item(db: Session, item_id: int) -> ShoppingListItem | None:
    return db.scalar(
        select(ShoppingListItem)
        .where(ShoppingListItem.id == item_id)
        .options(joinedload(ShoppingListItem.ingredient))
    )


def update_shopping_list_item(
    db: Session,
    item: ShoppingListItem,
    total_quantity: float | None = None,
    unit: str | None = None,
    purchased: bool | None = None
) -> ShoppingListItem:
    if total_quantity is not None:
        item.total_quantity = total_quantity
    if unit is not None:
        item.unit = unit
    if purchased is not None:
        item.purchased = purchased

    db.commit()
    db.refresh(item)
    return item


def toggle_item_purchased(db: Session, item: ShoppingListItem) -> ShoppingListItem:
    item.purchased = not item.purchased
    db.commit()
    db.refresh(item)
    return item


def add_item_to_shopping_list(
    db: Session,
    shopping_list_id: int,
    ingredient_id: int,
    total_quantity: float | None = None,
    unit: str | None = None
) -> ShoppingListItem:
    item = ShoppingListItem(
        shopping_list_id=shopping_list_id,
        ingredient_id=ingredient_id,
        total_quantity=total_quantity,
        unit=unit,
        purchased=False
    )
    db.add(item)
    db.commit()
    db.refresh(item)
    return item


def delete_shopping_list_item(db: Session, item: ShoppingListItem) -> None:
    db.delete(item)
    db.commit()
