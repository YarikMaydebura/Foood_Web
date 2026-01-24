from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session, joinedload
from sqlalchemy import select, func
from typing import Optional

from app.api.deps import get_db, get_current_user, get_optional_current_user
from app.models.user import User
from app.models.recipe import Recipe
from app.models.ingredient import Ingredient
from app.models.recipe_ingredient import RecipeIngredient
from app.models.tag import Tag
from app.models.user_saved_recipe import UserSavedRecipe
from app.schemas.recipe import RecipeOut, LibraryRecipeOut
from app.crud.tag import get_or_create_tag

router = APIRouter(prefix="/library", tags=["library"])


@router.get("/recipes")
def list_library_recipes(
    limit: int = Query(default=20, ge=1, le=100),
    offset: int = Query(default=0, ge=0),
    cuisine: Optional[str] = Query(default=None),
    category: Optional[str] = Query(default=None),
    difficulty: Optional[str] = Query(default=None),
    search: Optional[str] = Query(default=None),
    db: Session = Depends(get_db),
    current_user: Optional[User] = Depends(get_optional_current_user)
):
    """
    Get public recipes from the library.
    No authentication required - anyone can browse.
    If authenticated, includes is_saved flag.
    """
    query = select(Recipe).where(Recipe.is_public == True)

    # Apply filters
    if cuisine:
        query = query.where(Recipe.cuisine == cuisine)
    if category:
        query = query.where(Recipe.category == category)
    if difficulty:
        query = query.where(Recipe.difficulty == difficulty)
    if search:
        query = query.where(Recipe.title.ilike(f"%{search}%"))

    # Get total count
    count_query = select(func.count()).select_from(query.subquery())
    total = db.scalar(count_query)

    # Apply pagination and ordering
    query = query.order_by(Recipe.title).offset(offset).limit(limit)
    recipes = db.scalars(query).all()

    # Get user's saved recipe IDs if authenticated
    saved_recipe_ids = set()
    if current_user:
        saved = db.scalars(
            select(UserSavedRecipe.recipe_id).where(
                UserSavedRecipe.user_id == current_user.id
            )
        ).all()
        saved_recipe_ids = set(saved)

    # Add is_saved flag to recipes
    items = []
    for recipe in recipes:
        recipe_dict = {
            "id": recipe.id,
            "title": recipe.title,
            "description": recipe.description,
            "image_url": recipe.image_url,
            "slug": recipe.slug,
            "cuisine": recipe.cuisine,
            "category": recipe.category,
            "difficulty": recipe.difficulty,
            "prep_time_minutes": recipe.prep_time_minutes,
            "cook_time_minutes": recipe.cook_time_minutes,
            "servings": recipe.servings,
            "calories": recipe.calories,
            "is_saved": recipe.id in saved_recipe_ids
        }
        items.append(recipe_dict)

    return {
        "items": items,
        "total": total,
        "limit": limit,
        "offset": offset,
        "has_more": offset + len(recipes) < total
    }


@router.get("/saved")
def get_saved_recipes(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """
    Get user's saved library recipes.
    Authentication required.
    """
    saved_entries = db.scalars(
        select(UserSavedRecipe)
        .options(
            joinedload(UserSavedRecipe.recipe)
            .joinedload(Recipe.recipe_ingredients)
            .joinedload(RecipeIngredient.ingredient)
        )
        .where(UserSavedRecipe.user_id == current_user.id)
        .order_by(UserSavedRecipe.saved_at.desc())
    ).unique().all()

    items = []
    for entry in saved_entries:
        recipe = entry.recipe
        items.append({
            "id": recipe.id,
            "title": recipe.title,
            "description": recipe.description,
            "image_url": recipe.image_url,
            "slug": recipe.slug,
            "cuisine": recipe.cuisine,
            "category": recipe.category,
            "difficulty": recipe.difficulty,
            "prep_time_minutes": recipe.prep_time_minutes,
            "cook_time_minutes": recipe.cook_time_minutes,
            "servings": recipe.servings,
            "calories": recipe.calories,
            "saved_at": entry.saved_at,
            "notes": entry.notes,
            "rating": entry.rating,
            "is_saved": True,
            "recipe_ingredients": [
                {
                    "id": ri.id,
                    "quantity": ri.quantity,
                    "unit": ri.unit,
                    "ingredient": {
                        "id": ri.ingredient.id,
                        "name": ri.ingredient.name
                    }
                }
                for ri in recipe.recipe_ingredients
            ]
        })

    return {"items": items, "total": len(items)}


@router.get("/recipes/{slug}", response_model=RecipeOut)
def get_library_recipe_by_slug(
    slug: str,
    db: Session = Depends(get_db)
):
    """
    Get a public recipe by its slug.
    No authentication required - for public sharing.
    """
    recipe = db.scalar(
        select(Recipe).where(
            Recipe.slug == slug,
            Recipe.is_public == True
        )
    )

    if not recipe:
        raise HTTPException(status_code=404, detail="Recipe not found")

    return recipe


@router.get("/recipes/id/{recipe_id}", response_model=RecipeOut)
def get_library_recipe_by_id(
    recipe_id: int,
    db: Session = Depends(get_db)
):
    """
    Get a public recipe by its ID.
    No authentication required.
    """
    recipe = db.scalar(
        select(Recipe).where(
            Recipe.id == recipe_id,
            Recipe.is_public == True
        )
    )

    if not recipe:
        raise HTTPException(status_code=404, detail="Recipe not found")

    return recipe


@router.post("/recipes/{recipe_id}/save")
def save_library_recipe(
    recipe_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """
    Save/bookmark a library recipe (reference only, no copy).
    Authentication required.
    """
    # Check if recipe exists and is public
    recipe = db.scalar(
        select(Recipe).where(
            Recipe.id == recipe_id,
            Recipe.is_public == True
        )
    )

    if not recipe:
        raise HTTPException(status_code=404, detail="Recipe not found in library")

    # Check if already saved
    existing = db.scalar(
        select(UserSavedRecipe).where(
            UserSavedRecipe.user_id == current_user.id,
            UserSavedRecipe.recipe_id == recipe_id
        )
    )

    if existing:
        return {"message": "Recipe already saved", "is_saved": True}

    # Create save entry
    saved_recipe = UserSavedRecipe(
        user_id=current_user.id,
        recipe_id=recipe_id
    )
    db.add(saved_recipe)
    db.commit()

    return {"message": "Recipe saved to favorites", "is_saved": True}


@router.delete("/recipes/{recipe_id}/unsave")
def unsave_library_recipe(
    recipe_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """
    Remove a recipe from saved/favorites.
    Authentication required.
    """
    saved_entry = db.scalar(
        select(UserSavedRecipe).where(
            UserSavedRecipe.user_id == current_user.id,
            UserSavedRecipe.recipe_id == recipe_id
        )
    )

    if not saved_entry:
        raise HTTPException(status_code=404, detail="Recipe not in your saved list")

    db.delete(saved_entry)
    db.commit()

    return {"message": "Recipe removed from favorites", "is_saved": False}


@router.post("/recipes/{recipe_id}/copy")
def copy_library_recipe(
    recipe_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """
    Create an editable copy of a library recipe in user's collection.
    Use this when user wants to customize a recipe.
    Authentication required.
    """
    # Get the public recipe
    library_recipe = db.scalar(
        select(Recipe).where(
            Recipe.id == recipe_id,
            Recipe.is_public == True
        )
    )

    if not library_recipe:
        raise HTTPException(status_code=404, detail="Recipe not found in library")

    # Create a copy for the user
    new_recipe = Recipe(
        user_id=current_user.id,
        title=f"{library_recipe.title} (My Version)",
        description=library_recipe.description,
        image_url=library_recipe.image_url,
        instructions=library_recipe.instructions,
        calories=library_recipe.calories,
        protein_g=library_recipe.protein_g,
        carbs_g=library_recipe.carbs_g,
        fat_g=library_recipe.fat_g,
        fiber_g=library_recipe.fiber_g,
        sugar_g=library_recipe.sugar_g,
        sodium_mg=library_recipe.sodium_mg,
        cholesterol_mg=library_recipe.cholesterol_mg,
        servings=library_recipe.servings,
        prep_time_minutes=library_recipe.prep_time_minutes,
        cook_time_minutes=library_recipe.cook_time_minutes,
        difficulty=library_recipe.difficulty,
        cuisine=library_recipe.cuisine,
        category=library_recipe.category,
        is_public=False,  # User's copy is private
        source="copied",
        copied_from_id=library_recipe.id
    )

    db.add(new_recipe)
    db.flush()  # Get the new recipe ID

    # Copy ingredients
    for ri in library_recipe.recipe_ingredients:
        ingredient = db.scalar(
            select(Ingredient).where(Ingredient.name == ri.ingredient.name)
        )
        if not ingredient:
            ingredient = Ingredient(name=ri.ingredient.name)
            db.add(ingredient)
            db.flush()

        new_ri = RecipeIngredient(
            recipe_id=new_recipe.id,
            ingredient_id=ingredient.id,
            quantity=ri.quantity,
            unit=ri.unit,
            note=ri.note
        )
        db.add(new_ri)

    # Copy tags
    for tag in library_recipe.tags:
        user_tag = get_or_create_tag(db, current_user.id, tag.name)
        new_recipe.tags.append(user_tag)

    db.commit()
    db.refresh(new_recipe)

    return {
        "message": "Recipe copied to your collection",
        "recipe_id": new_recipe.id
    }


# Keep the old endpoint for backward compatibility (redirects to save)
@router.post("/recipes/{recipe_id}/add-to-collection")
def add_library_recipe_to_collection(
    recipe_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """
    DEPRECATED: Use /save for bookmarking or /copy for customization.
    This now saves a reference (bookmark) instead of copying.
    """
    return save_library_recipe(recipe_id, db, current_user)


@router.get("/cuisines")
def get_available_cuisines(db: Session = Depends(get_db)):
    """Get list of cuisines available in the library."""
    cuisines = db.scalars(
        select(Recipe.cuisine)
        .where(Recipe.is_public == True, Recipe.cuisine.isnot(None))
        .distinct()
        .order_by(Recipe.cuisine)
    ).all()
    return {"cuisines": cuisines}


@router.get("/categories")
def get_available_categories(db: Session = Depends(get_db)):
    """Get list of categories available in the library."""
    categories = db.scalars(
        select(Recipe.category)
        .where(Recipe.is_public == True, Recipe.category.isnot(None))
        .distinct()
        .order_by(Recipe.category)
    ).all()
    return {"categories": categories}
