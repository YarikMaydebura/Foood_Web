from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.core.config import settings
from app.db.session import engine
from app.db.base import Base

# Import all models so they are registered with SQLAlchemy
from app.models.user import User  # noqa
from app.models.recipe import Recipe  # noqa
# Import both MealPlan and MealPlanEntry models for table creation
from app.models.meal_plan import MealPlan, MealPlanEntry  # noqa
from app.models.ingredient import Ingredient  # noqa
from app.models.tag import Tag  # noqa
from app.models.recipe_ingredient import RecipeIngredient  # noqa
from app.models.recipe_tag import recipe_tags  # noqa
from app.models.shopping_list import ShoppingList  # noqa
from app.models.shopping_list_item import ShoppingListItem  # noqa
from app.models.email_verification import EmailVerificationCode  # noqa
from app.models.user_preference import UserPreference  # noqa

# Import routers
from app.api.routes.auth import router as auth_router
from app.api.routes.recipes import router as recipes_router
from app.api.routes.meal_plan import router as meal_plan_router
from app.api.routes.ingredients import router as ingredients_router
from app.api.routes.tags import router as tags_router
from app.api.routes.shopping_lists import router as shopping_lists_router
from app.api.routes.onboarding import router as onboarding_router

app = FastAPI(title="Recipe Manager API", version="2.0.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=[o.strip() for o in settings.CORS_ORIGINS.split(",") if o.strip()],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Create all tables
Base.metadata.create_all(bind=engine)

# Include routers
app.include_router(auth_router)
app.include_router(recipes_router)
app.include_router(meal_plan_router)
app.include_router(ingredients_router)
app.include_router(tags_router)
app.include_router(shopping_lists_router)
app.include_router(onboarding_router)


@app.get("/health")
def health():
    return {"ok": True, "status": "running"}
