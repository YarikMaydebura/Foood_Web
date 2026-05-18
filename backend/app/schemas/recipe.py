from pydantic import BaseModel
from datetime import datetime
from decimal import Decimal
from app.schemas.ingredient import RecipeIngredientCreate, RecipeIngredientOut
from app.schemas.tag import TagOut


class RecipeCreate(BaseModel):
    title: str
    description: str | None = None
    image_url: str | None = None
    instructions: str
    ingredients: list[RecipeIngredientCreate] = []
    tag_ids: list[int] = []
    tags: list[str] = []  # Accept tag names from frontend
    # Nutritional info
    calories: int | None = None
    protein_g: float | None = None
    carbs_g: float | None = None
    fat_g: float | None = None
    fiber_g: float | None = None
    sugar_g: float | None = None
    sodium_mg: float | None = None
    cholesterol_mg: float | None = None
    servings: int = 4
    # Metadata
    prep_time_minutes: int | None = None
    cook_time_minutes: int | None = None
    difficulty: str | None = None
    cuisine: str | None = None
    category: str | None = "meal"
    # Sharing — default public so other users can find new recipes in Browse.
    is_public: bool = True


class RecipeUpdate(BaseModel):
    title: str | None = None
    description: str | None = None
    image_url: str | None = None
    instructions: str | None = None
    ingredients: list[RecipeIngredientCreate] | None = None
    tag_ids: list[int] | None = None
    tags: list[str] | None = None  # Accept tag names from frontend
    # Nutritional info
    calories: int | None = None
    protein_g: float | None = None
    carbs_g: float | None = None
    fat_g: float | None = None
    fiber_g: float | None = None
    sugar_g: float | None = None
    sodium_mg: float | None = None
    cholesterol_mg: float | None = None
    servings: int | None = None
    # Metadata
    prep_time_minutes: int | None = None
    cook_time_minutes: int | None = None
    difficulty: str | None = None
    cuisine: str | None = None
    category: str | None = None
    is_public: bool | None = None


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
    # Nutritional info
    calories: int | None = None
    protein_g: Decimal | None = None
    carbs_g: Decimal | None = None
    fat_g: Decimal | None = None
    fiber_g: Decimal | None = None
    sugar_g: Decimal | None = None
    sodium_mg: Decimal | None = None
    cholesterol_mg: Decimal | None = None
    servings: int = 4
    # Metadata
    slug: str | None = None
    is_public: bool = False
    source: str | None = "user"
    prep_time_minutes: int | None = None
    cook_time_minutes: int | None = None
    difficulty: str | None = None
    cuisine: str | None = None
    category: str | None = "meal"

    class Config:
        from_attributes = True


class RecipeListOut(BaseModel):
    """Simplified recipe output for list views"""
    id: int
    user_id: int
    title: str
    description: str | None
    image_url: str | None
    instructions: str
    created_at: datetime
    recipe_ingredients: list[RecipeIngredientOut] = []
    tags: list[TagOut] = []
    # Nutritional info (included for cards)
    calories: int | None = None
    protein_g: Decimal | None = None
    carbs_g: Decimal | None = None
    fat_g: Decimal | None = None
    servings: int = 4
    # Metadata (included for cards)
    slug: str | None = None
    is_public: bool = False
    prep_time_minutes: int | None = None
    cook_time_minutes: int | None = None
    difficulty: str | None = None
    cuisine: str | None = None
    category: str | None = "meal"

    class Config:
        from_attributes = True


class LibraryRecipeOut(BaseModel):
    """Public recipe from library"""
    id: int
    title: str
    description: str | None
    image_url: str | None
    slug: str | None
    cuisine: str | None
    category: str | None
    difficulty: str | None
    prep_time_minutes: int | None
    cook_time_minutes: int | None
    calories: int | None
    protein_g: Decimal | None
    carbs_g: Decimal | None
    fat_g: Decimal | None
    servings: int = 4
    tags: list[TagOut] = []

    class Config:
        from_attributes = True
