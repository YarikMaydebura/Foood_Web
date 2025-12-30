from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.api.deps import get_db, get_current_user
from app.models.user import User
from app.schemas.ingredient import IngredientCreate, IngredientUpdate, IngredientOut
from app.crud import ingredient as crud_ingredient

router = APIRouter(prefix="/ingredients", tags=["ingredients"])


@router.get("", response_model=list[IngredientOut])
def list_ingredients(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Get all ingredients"""
    return crud_ingredient.list_ingredients(db)


@router.get("/{ingredient_id}", response_model=IngredientOut)
def get_ingredient(
    ingredient_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Get a specific ingredient by ID"""
    ingredient = crud_ingredient.get_ingredient(db, ingredient_id)
    if not ingredient:
        raise HTTPException(status_code=404, detail="Ingredient not found")
    return ingredient


@router.post("", response_model=IngredientOut, status_code=201)
def create_ingredient(
    body: IngredientCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Create a new ingredient"""
    # Check if ingredient already exists
    existing = crud_ingredient.get_ingredient_by_name(db, body.name)
    if existing:
        raise HTTPException(status_code=400, detail="Ingredient already exists")
    return crud_ingredient.create_ingredient(db, body.name)


@router.put("/{ingredient_id}", response_model=IngredientOut)
def update_ingredient(
    ingredient_id: int,
    body: IngredientUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Update an ingredient"""
    ingredient = crud_ingredient.get_ingredient(db, ingredient_id)
    if not ingredient:
        raise HTTPException(status_code=404, detail="Ingredient not found")
    if body.name:
        return crud_ingredient.update_ingredient(db, ingredient, body.name)
    return ingredient


@router.delete("/{ingredient_id}")
def delete_ingredient(
    ingredient_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Delete an ingredient"""
    ingredient = crud_ingredient.get_ingredient(db, ingredient_id)
    if not ingredient:
        raise HTTPException(status_code=404, detail="Ingredient not found")
    crud_ingredient.delete_ingredient(db, ingredient)
    return {"ok": True}
