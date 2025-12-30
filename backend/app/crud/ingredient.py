from sqlalchemy.orm import Session
from sqlalchemy import select
from app.models.ingredient import Ingredient


def list_ingredients(db: Session) -> list[Ingredient]:
    return list(db.scalars(select(Ingredient).order_by(Ingredient.name)))


def get_ingredient(db: Session, ingredient_id: int) -> Ingredient | None:
    return db.scalar(select(Ingredient).where(Ingredient.id == ingredient_id))


def get_ingredient_by_name(db: Session, name: str) -> Ingredient | None:
    return db.scalar(select(Ingredient).where(Ingredient.name == name))


def create_ingredient(db: Session, name: str) -> Ingredient:
    ingredient = Ingredient(name=name)
    db.add(ingredient)
    db.commit()
    db.refresh(ingredient)
    return ingredient


def get_or_create_ingredient(db: Session, name: str) -> Ingredient:
    """Get existing ingredient by name or create new one"""
    ingredient = get_ingredient_by_name(db, name)
    if not ingredient:
        ingredient = create_ingredient(db, name)
    return ingredient


def update_ingredient(db: Session, ingredient: Ingredient, name: str) -> Ingredient:
    ingredient.name = name
    db.commit()
    db.refresh(ingredient)
    return ingredient


def delete_ingredient(db: Session, ingredient: Ingredient) -> None:
    db.delete(ingredient)
    db.commit()
