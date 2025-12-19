from pydantic import BaseModel


class IngredientCreate(BaseModel):
    name: str


class IngredientUpdate(BaseModel):
    name: str | None = None


class IngredientOut(BaseModel):
    id: int
    name: str

    class Config:
        from_attributes = True


class RecipeIngredientCreate(BaseModel):
    ingredient_id: int | None = None
    ingredient_name: str | None = None  # Can create new ingredient by name
    quantity: float | None = None
    unit: str | None = None
    note: str | None = None


class RecipeIngredientOut(BaseModel):
    ingredient_id: int
    ingredient: IngredientOut
    quantity: float | None
    unit: str | None
    note: str | None

    class Config:
        from_attributes = True
