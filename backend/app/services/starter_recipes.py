"""
Service to assign starter recipes to new users.
Copies existing recipes from the database so new users have content to start with.
"""
from sqlalchemy.orm import Session
from sqlalchemy import select

from app.models.recipe import Recipe
from app.models.recipe_ingredient import RecipeIngredient
from app.models.user import User


def assign_starter_recipes(db: Session, user: User, limit: int = 10) -> list[Recipe]:
    """
    Copy starter recipes to a new user.
    Takes existing recipes from other users and creates copies for the new user.
    """
    # Get existing recipes (not belonging to this user)
    existing_recipes = db.scalars(
        select(Recipe)
        .where(Recipe.user_id != user.id)
        .limit(limit)
    ).all()

    if not existing_recipes:
        return []

    new_recipes = []

    for original in existing_recipes:
        # Create a copy of the recipe for the new user
        new_recipe = Recipe(
            user_id=user.id,
            title=original.title,
            description=original.description,
            image_url=original.image_url,
            instructions=original.instructions
        )
        db.add(new_recipe)
        db.flush()  # Get the new recipe ID

        # Copy recipe ingredients
        for ri in original.recipe_ingredients:
            new_ri = RecipeIngredient(
                recipe_id=new_recipe.id,
                ingredient_id=ri.ingredient_id,
                quantity=ri.quantity,
                unit=ri.unit,
                note=ri.note
            )
            db.add(new_ri)

        # Copy tags (tags are shared, just link them)
        for tag in original.tags:
            new_recipe.tags.append(tag)

        new_recipes.append(new_recipe)

    return new_recipes
