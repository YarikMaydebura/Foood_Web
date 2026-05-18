from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from starlette.middleware.base import BaseHTTPMiddleware
from slowapi import Limiter, _rate_limit_exceeded_handler
from slowapi.util import get_remote_address
from slowapi.errors import RateLimitExceeded

from app.core.config import settings
from app.db.session import engine
from app.db.base import Base

# Initialize rate limiter
limiter = Limiter(key_func=get_remote_address, default_limits=["100/minute"])


class SecurityHeadersMiddleware(BaseHTTPMiddleware):
    """Add security headers to all responses."""
    async def dispatch(self, request: Request, call_next):
        response = await call_next(request)
        response.headers["X-Content-Type-Options"] = "nosniff"
        response.headers["X-Frame-Options"] = "DENY"
        response.headers["X-XSS-Protection"] = "1; mode=block"
        response.headers["Referrer-Policy"] = "strict-origin-when-cross-origin"
        return response


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
from app.api.routes.library import router as library_router
from app.api.routes.reviews import router as reviews_router

app = FastAPI(title="Recipe Manager API", version="2.0.0")

# Add rate limiter to app state
app.state.limiter = limiter
app.add_exception_handler(RateLimitExceeded, _rate_limit_exceeded_handler)

# Security headers middleware
app.add_middleware(SecurityHeadersMiddleware)

# CORS middleware - restricted to specific methods and headers
app.add_middleware(
    CORSMiddleware,
    allow_origins=[o.strip() for o in settings.CORS_ORIGINS.split(",") if o.strip()],
    allow_credentials=True,
    allow_methods=["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allow_headers=["Authorization", "Content-Type", "Accept"],
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
app.include_router(library_router)
app.include_router(reviews_router)


@app.api_route("/health", methods=["GET", "HEAD"])
def health():
    return {"ok": True, "status": "running"}

