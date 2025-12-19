from pydantic import BaseModel
from datetime import datetime
from app.schemas.ingredient import RecipeIngredientCreate, RecipeIngredientOut
from app.schemas.tag import TagOut


class RecipeCreate(BaseModel):
    title: str
    description: str | None = None
    image_url: str | None = None
    instructions: str
    ingredients: list[RecipeIngredientCreate] = []
    tag_ids: list[int] = []


class RecipeUpdate(BaseModel):
    title: str | None = None
    description: str | None = None
    image_url: str | None = None
    instructions: str | None = None
    ingredients: list[RecipeIngredientCreate] | None = None
    tag_ids: list[int] | None = None


class RecipeOut(BaseModel):
    id: int
    user_id: int
    title: str
    description: str | None
    image_url: str | None
    instructions: str
    created_at: datetime
    updated_at: datetime | None
    recipe_ingredients: list[RecipeIngredientOut] = []
    tags: list[TagOut] = []

    class Config:
        from_attributes = True


class RecipeListOut(BaseModel):
    """Simplified recipe output for list views"""
    id: int
    user_id: int
    title: str
    description: str | None
    image_url: str | None
    created_at: datetime
    tags: list[TagOut] = []

    class Config:
        from_attributes = True
