from sqlalchemy.orm import Session, joinedload
from sqlalchemy import select
from app.models.recipe import Recipe
from app.models.recipe_ingredient import RecipeIngredient
from app.models.tag import Tag
from app.crud.ingredient import get_or_create_ingredient, get_ingredient
from app.crud.tag import get_tags_by_ids


def list_recipes_by_user(db: Session, user_id: int) -> list[Recipe]:
    return list(db.scalars(
        select(Recipe)
        .where(Recipe.user_id == user_id)
        .options(joinedload(Recipe.tags), joinedload(Recipe.recipe_ingredients))
        .order_by(Recipe.id.desc())
    ).unique())


def get_recipe(db: Session, recipe_id: int) -> Recipe | None:
    return db.scalar(
        select(Recipe)
        .where(Recipe.id == recipe_id)
        .options(
            joinedload(Recipe.tags),
            joinedload(Recipe.recipe_ingredients).joinedload(RecipeIngredient.ingredient)
        )
    )


def get_recipe_by_user(db: Session, recipe_id: int, user_id: int) -> Recipe | None:
    return db.scalar(
        select(Recipe)
        .where(Recipe.id == recipe_id, Recipe.user_id == user_id)
        .options(
            joinedload(Recipe.tags),
            joinedload(Recipe.recipe_ingredients).joinedload(RecipeIngredient.ingredient)
        )
    )


def create_recipe(
    db: Session,
    user_id: int,
    title: str,
    instructions: str,
    description: str | None = None,
    image_url: str | None = None,
    ingredients: list[dict] | None = None,
    tag_ids: list[int] | None = None,
) -> Recipe:
    # Create recipe
    recipe = Recipe(
        user_id=user_id,
        title=title,
        instructions=instructions,
        description=description,
        image_url=image_url,
    )
    db.add(recipe)
    db.flush()  # Get recipe ID

    # Add ingredients
    if ingredients:
        for ing_data in ingredients:
            # Get or create ingredient
            if ing_data.get("ingredient_id"):
                ingredient = get_ingredient(db, ing_data["ingredient_id"])
            elif ing_data.get("ingredient_name"):
                ingredient = get_or_create_ingredient(db, ing_data["ingredient_name"])
            else:
                continue

            if ingredient:
                recipe_ingredient = RecipeIngredient(
                    recipe_id=recipe.id,
                    ingredient_id=ingredient.id,
                    quantity=ing_data.get("quantity"),
                    unit=ing_data.get("unit"),
                    note=ing_data.get("note"),
                )
                db.add(recipe_ingredient)

    # Add tags
    if tag_ids:
        tags = get_tags_by_ids(db, user_id, tag_ids)
        recipe.tags = tags

    db.commit()
    db.refresh(recipe)
    return recipe


def update_recipe(
    db: Session,
    recipe: Recipe,
    title: str | None = None,
    instructions: str | None = None,
    description: str | None = None,
    image_url: str | None = None,
    ingredients: list[dict] | None = None,
    tag_ids: list[int] | None = None,
) -> Recipe:
    # Update basic fields
    if title is not None:
        recipe.title = title
    if instructions is not None:
        recipe.instructions = instructions
    if description is not None:
        recipe.description = description
    if image_url is not None:
        recipe.image_url = image_url

    # Update ingredients (replace all)
    if ingredients is not None:
        # Remove existing ingredients
        for ri in recipe.recipe_ingredients:
            db.delete(ri)
        db.flush()

        # Add new ingredients
        for ing_data in ingredients:
            if ing_data.get("ingredient_id"):
                ingredient = get_ingredient(db, ing_data["ingredient_id"])
            elif ing_data.get("ingredient_name"):
                ingredient = get_or_create_ingredient(db, ing_data["ingredient_name"])
            else:
                continue

            if ingredient:
                recipe_ingredient = RecipeIngredient(
                    recipe_id=recipe.id,
                    ingredient_id=ingredient.id,
                    quantity=ing_data.get("quantity"),
                    unit=ing_data.get("unit"),
                    note=ing_data.get("note"),
                )
                db.add(recipe_ingredient)

    # Update tags (replace all)
    if tag_ids is not None:
        tags = get_tags_by_ids(db, recipe.user_id, tag_ids)
        recipe.tags = tags

    db.commit()
    db.refresh(recipe)
    return recipe


def delete_recipe(db: Session, recipe: Recipe) -> None:
    db.delete(recipe)
    db.commit()


def search_recipes(db: Session, user_id: int, query: str) -> list[Recipe]:
    """Search recipes by title"""
    return list(db.scalars(
        select(Recipe)
        .where(Recipe.user_id == user_id, Recipe.title.ilike(f"%{query}%"))
        .options(joinedload(Recipe.tags))
        .order_by(Recipe.id.desc())
    ).unique())


def get_recipes_by_tag(db: Session, user_id: int, tag_id: int) -> list[Recipe]:
    """Get all recipes with a specific tag"""
    return list(db.scalars(
        select(Recipe)
        .join(Recipe.tags)
        .where(Recipe.user_id == user_id, Tag.id == tag_id)
        .options(joinedload(Recipe.tags))
        .order_by(Recipe.id.desc())
    ).unique())
