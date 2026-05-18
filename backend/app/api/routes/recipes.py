from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session

from app.api.deps import get_db, get_current_user
from app.models.user import User
from app.schemas.recipe import RecipeCreate, RecipeUpdate, RecipeOut, RecipeListOut
from app.crud import recipe as crud_recipe
from app.crud.tag import get_or_create_tag

router = APIRouter(prefix="/recipes", tags=["recipes"])


@router.get("")
def list_recipes(
    limit: int = Query(default=50, ge=1, le=100, description="Items per page"),
    offset: int = Query(default=0, ge=0, description="Items to skip"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Get all recipes for the current user with pagination"""
    recipes, total = crud_recipe.list_recipes_by_user(db, current_user.id, limit, offset)
    return {
        "items": recipes,
        "total": total,
        "limit": limit,
        "offset": offset,
        "has_more": offset + len(recipes) < total
    }


@router.get("/{recipe_id}", response_model=RecipeOut)
def get_recipe(
    recipe_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Get a specific recipe by ID"""
    recipe = crud_recipe.get_recipe_by_user(db, recipe_id, current_user.id)
    if not recipe:
        raise HTTPException(status_code=404, detail="Recipe not found")
    return recipe


@router.post("", response_model=RecipeOut, status_code=201)
def create_recipe(
    body: RecipeCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Create a new recipe"""
    # Convert tag names to tag IDs (get or create tags)
    tag_ids = body.tag_ids
    if body.tags:
        tags = [get_or_create_tag(db, current_user.id, tag_name.strip())
                for tag_name in body.tags if tag_name.strip()]
        tag_ids = [tag.id for tag in tags]

    extras = body.model_dump(
        exclude={"title", "instructions", "description", "image_url", "ingredients", "tag_ids", "tags"}
    )
    return crud_recipe.create_recipe(
        db,
        user_id=current_user.id,
        title=body.title,
        instructions=body.instructions,
        description=body.description,
        image_url=body.image_url,
        ingredients=[ing.model_dump() for ing in body.ingredients],
        tag_ids=tag_ids,
        **extras,
    )


@router.put("/{recipe_id}", response_model=RecipeOut)
def update_recipe(
    recipe_id: int,
    body: RecipeUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Update an existing recipe"""
    recipe = crud_recipe.get_recipe_by_user(db, recipe_id, current_user.id)
    if not recipe:
        raise HTTPException(status_code=404, detail="Recipe not found")

    ingredients = None
    if body.ingredients is not None:
        ingredients = [ing.model_dump() for ing in body.ingredients]

    # Convert tag names to tag IDs (get or create tags)
    tag_ids = body.tag_ids
    if body.tags is not None:
        tags = [get_or_create_tag(db, current_user.id, tag_name.strip())
                for tag_name in body.tags if tag_name.strip()]
        tag_ids = [tag.id for tag in tags]

    extras = body.model_dump(
        exclude={"title", "instructions", "description", "image_url", "ingredients", "tag_ids", "tags"},
        exclude_none=True,
    )
    return crud_recipe.update_recipe(
        db,
        recipe,
        title=body.title,
        instructions=body.instructions,
        description=body.description,
        image_url=body.image_url,
        ingredients=ingredients,
        tag_ids=tag_ids,
        **extras,
    )


@router.delete("/{recipe_id}")
def delete_recipe(
    recipe_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Delete a recipe"""
    recipe = crud_recipe.get_recipe_by_user(db, recipe_id, current_user.id)
    if not recipe:
        raise HTTPException(status_code=404, detail="Recipe not found")
    crud_recipe.delete_recipe(db, recipe)
    return {"ok": True}


@router.get("/search/{query}")
def search_recipes(
    query: str,
    limit: int = Query(default=50, ge=1, le=100, description="Items per page"),
    offset: int = Query(default=0, ge=0, description="Items to skip"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Search recipes by title with pagination"""
    recipes, total = crud_recipe.search_recipes(db, current_user.id, query, limit, offset)
    return {
        "items": recipes,
        "total": total,
        "limit": limit,
        "offset": offset,
        "has_more": offset + len(recipes) < total
    }
