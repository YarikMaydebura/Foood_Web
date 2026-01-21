from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from sqlalchemy import select, func
from typing import Optional

from app.api.deps import get_db, get_current_user
from app.models.user import User
from app.models.recipe import Recipe
from app.models.ingredient import Ingredient
from app.models.recipe_ingredient import RecipeIngredient
from app.models.tag import Tag
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
    db: Session = Depends(get_db)
):
    """
    Get public recipes from the library.
    No authentication required - anyone can browse.
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

    return {
        "items": recipes,
        "total": total,
        "limit": limit,
        "offset": offset,
        "has_more": offset + len(recipes) < total
    }


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


@router.post("/recipes/{recipe_id}/add-to-collection")
def add_library_recipe_to_collection(
    recipe_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """
    Copy a public library recipe to the user's personal collection.
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
        title=library_recipe.title,
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
        source="imported"
    )

    db.add(new_recipe)
    db.flush()  # Get the new recipe ID

    # Copy ingredients
    for ri in library_recipe.recipe_ingredients:
        # Get or create the ingredient for this user
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

    # Copy tags (get or create for the user)
    for tag in library_recipe.tags:
        user_tag = get_or_create_tag(db, current_user.id, tag.name)
        new_recipe.tags.append(user_tag)

    db.commit()
    db.refresh(new_recipe)

    return {
        "message": "Recipe added to your collection",
        "recipe_id": new_recipe.id
    }


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
