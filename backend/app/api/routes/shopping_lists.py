from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from datetime import date

from app.api.deps import get_db, get_current_user
from app.models.user import User
from app.schemas.shopping_list import (
    ShoppingListOut,
    ShoppingListItemUpdate,
    ShoppingListItemOut,
    ShoppingListGenerateRequest,
)
from app.crud import shopping_list as crud_shopping

router = APIRouter(prefix="/shopping-lists", tags=["shopping-lists"])


@router.get("", response_model=list[ShoppingListOut])
def list_shopping_lists(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Get all shopping lists for the current user"""
    return crud_shopping.list_shopping_lists_by_user(db, current_user.id)


@router.get("/week/{week_start_date}", response_model=ShoppingListOut)
def get_shopping_list_by_week(
    week_start_date: date,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Get shopping list for a specific week"""
    shopping_list = crud_shopping.get_shopping_list_by_week(db, current_user.id, week_start_date)
    if not shopping_list:
        raise HTTPException(status_code=404, detail="Shopping list not found")
    return shopping_list


@router.post("/generate", response_model=ShoppingListOut, status_code=201)
def generate_shopping_list(
    body: ShoppingListGenerateRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Generate shopping list from meal plan for a specific week"""
    return crud_shopping.generate_shopping_list_from_meal_plan(
        db, current_user.id, body.week_start_date
    )


@router.get("/{shopping_list_id}", response_model=ShoppingListOut)
def get_shopping_list(
    shopping_list_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Get a specific shopping list by ID"""
    shopping_list = crud_shopping.get_shopping_list(db, shopping_list_id)
    if not shopping_list or shopping_list.user_id != current_user.id:
        raise HTTPException(status_code=404, detail="Shopping list not found")
    return shopping_list


@router.delete("/{shopping_list_id}")
def delete_shopping_list(
    shopping_list_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Delete a shopping list"""
    shopping_list = crud_shopping.get_shopping_list(db, shopping_list_id)
    if not shopping_list or shopping_list.user_id != current_user.id:
        raise HTTPException(status_code=404, detail="Shopping list not found")
    crud_shopping.delete_shopping_list(db, shopping_list)
    return {"ok": True}


# Shopping List Item endpoints
@router.put("/items/{item_id}", response_model=ShoppingListItemOut)
def update_shopping_list_item(
    item_id: int,
    body: ShoppingListItemUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Update a shopping list item"""
    item = crud_shopping.get_shopping_list_item(db, item_id)
    if not item:
        raise HTTPException(status_code=404, detail="Item not found")

    # Verify ownership
    shopping_list = crud_shopping.get_shopping_list(db, item.shopping_list_id)
    if not shopping_list or shopping_list.user_id != current_user.id:
        raise HTTPException(status_code=404, detail="Item not found")

    return crud_shopping.update_shopping_list_item(
        db,
        item,
        total_quantity=body.total_quantity,
        unit=body.unit,
        purchased=body.purchased,
    )


@router.post("/items/{item_id}/toggle", response_model=ShoppingListItemOut)
def toggle_item_purchased(
    item_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Toggle the purchased status of a shopping list item"""
    item = crud_shopping.get_shopping_list_item(db, item_id)
    if not item:
        raise HTTPException(status_code=404, detail="Item not found")

    # Verify ownership
    shopping_list = crud_shopping.get_shopping_list(db, item.shopping_list_id)
    if not shopping_list or shopping_list.user_id != current_user.id:
        raise HTTPException(status_code=404, detail="Item not found")

    return crud_shopping.toggle_item_purchased(db, item)


@router.delete("/items/{item_id}")
def delete_shopping_list_item(
    item_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Delete a shopping list item"""
    item = crud_shopping.get_shopping_list_item(db, item_id)
    if not item:
        raise HTTPException(status_code=404, detail="Item not found")

    # Verify ownership
    shopping_list = crud_shopping.get_shopping_list(db, item.shopping_list_id)
    if not shopping_list or shopping_list.user_id != current_user.id:
        raise HTTPException(status_code=404, detail="Item not found")

    crud_shopping.delete_shopping_list_item(db, item)
    return {"ok": True}
