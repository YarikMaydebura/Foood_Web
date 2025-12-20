from app.schemas.auth import RegisterIn, LoginIn, TokenOut
from app.schemas.user import UserOut
from app.schemas.ingredient import (
    IngredientCreate,
    IngredientUpdate,
    IngredientOut,
    RecipeIngredientCreate,
    RecipeIngredientOut,
)
from app.schemas.tag import TagCreate, TagUpdate, TagOut
from app.schemas.recipe import RecipeCreate, RecipeUpdate, RecipeOut, RecipeListOut
from app.schemas.meal_plan import (
    MealPlanEntryCreate,
    MealPlanEntryUpdate,
    MealPlanEntryOut,
    MealPlanEntryWithRecipe,
    WeeklyMealPlanRequest,
    WeeklyMealPlanOut,
)
from app.schemas.shopping_list import (
    ShoppingListCreate,
    ShoppingListOut,
    ShoppingListItemCreate,
    ShoppingListItemUpdate,
    ShoppingListItemOut,
    ShoppingListGenerateRequest,
)

__all__ = [
    # Auth
    "RegisterIn",
    "LoginIn",
    "TokenOut",
    # User
    "UserOut",
    # Ingredient
    "IngredientCreate",
    "IngredientUpdate",
    "IngredientOut",
    "RecipeIngredientCreate",
    "RecipeIngredientOut",
    # Tag
    "TagCreate",
    "TagUpdate",
    "TagOut",
    # Recipe
    "RecipeCreate",
    "RecipeUpdate",
    "RecipeOut",
    "RecipeListOut",
    # Meal Plan
    "MealPlanEntryCreate",
    "MealPlanEntryUpdate",
    "MealPlanEntryOut",
    "MealPlanEntryWithRecipe",
    "WeeklyMealPlanRequest",
    "WeeklyMealPlanOut",
    # Shopping List
    "ShoppingListCreate",
    "ShoppingListOut",
    "ShoppingListItemCreate",
    "ShoppingListItemUpdate",
    "ShoppingListItemOut",
    "ShoppingListGenerateRequest",
]
