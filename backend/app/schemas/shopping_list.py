from pydantic import BaseModel
from datetime import date, datetime
from app.schemas.ingredient import IngredientOut


class ShoppingListItemCreate(BaseModel):
    ingredient_id: int
    total_quantity: float | None = None
    unit: str | None = None
    purchased: bool = False


class ShoppingListItemUpdate(BaseModel):
    total_quantity: float | None = None
    unit: str | None = None
    purchased: bool | None = None


class ShoppingListItemOut(BaseModel):
    id: int
    shopping_list_id: int
    ingredient_id: int
    ingredient: IngredientOut
    total_quantity: float | None
    unit: str | None
    purchased: bool
    # Per-day breakdown of the quantity that contributed to this item.
    # Keys are day_of_week as strings ("0".."6"); values are the qty added
    # by entries on that day. Only present on freshly generated lists; reads
    # of persisted lists won't include it.
    day_quantities: dict[str, float] | None = None

    class Config:
        from_attributes = True


class ShoppingListCreate(BaseModel):
    week_start_date: date


class ShoppingListOut(BaseModel):
    id: int
    user_id: int
    week_start_date: date
    created_at: datetime
    items: list[ShoppingListItemOut] = []

    class Config:
        from_attributes = True


class ShoppingListGenerateRequest(BaseModel):
    """Request to generate shopping list from meal plan"""
    week_start_date: date
