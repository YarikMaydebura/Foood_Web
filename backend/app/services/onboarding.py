"""
Service for handling user onboarding and personalized recipe assignment.
"""
from sqlalchemy.orm import Session, joinedload
from sqlalchemy import select, func

from app.models.user import User
from app.models.user_preference import UserPreference
from app.models.recipe import Recipe
from app.models.tag import Tag
from app.models.recipe_ingredient import RecipeIngredient


# Canonical tag names for onboarding (must match seed data)
DIET_TAGS = ["Vegetarian", "Healthy", "Comfort Food"]
CUISINE_TAGS = ["Italian", "Asian", "Mediterranean", "American", "Japanese", "French", "Thai"]


def save_preferences(
    db: Session,
    user: User,
    diet_preferences: list[str],
    cuisine_preferences: list[str]
) -> list[UserPreference]:
    """Save user's onboarding preferences."""
    # Clear any existing preferences
    db.query(UserPreference).filter(UserPreference.user_id == user.id).delete()

    preferences = []

    # Save diet preferences
    for tag_name in diet_preferences:
        if tag_name in DIET_TAGS:
            pref = UserPreference(
                user_id=user.id,
                preference_type="diet",
                tag_name=tag_name
            )
            db.add(pref)
            preferences.append(pref)

    # Save cuisine preferences
    for tag_name in cuisine_preferences:
        if tag_name in CUISINE_TAGS:
            pref = UserPreference(
                user_id=user.id,
                preference_type="cuisine",
                tag_name=tag_name
            )
            db.add(pref)
            preferences.append(pref)

    db.flush()
    return preferences


def get_user_preferences(db: Session, user_id: int) -> list[UserPreference]:
    """Get all preferences for a user."""
    return list(db.scalars(
        select(UserPreference).where(UserPreference.user_id == user_id)
    ))


def assign_personalized_recipes(
    db: Session,
    user: User,
    limit: int = 10
) -> list[Recipe]:
    """
    Assign recipes to user based on their preferences.

    Algorithm:
    1. Find recipes matching user's preferred tags
    2. Score recipes by number of matching tags
    3. Take top recipes, prioritizing those with more matches
    4. If not enough matches, fill with popular recipes
    """
    preferences = get_user_preferences(db, user.id)
    preferred_tags = [p.tag_name for p in preferences]

    if not preferred_tags:
        # No preferences, use random assignment
        from app.services.starter_recipes import assign_starter_recipes
        return assign_starter_recipes(db, user, limit)

    # Find recipes from other users that have matching tags
    # We join on tag NAME since tags are user-specific
    matching_recipes = db.execute(
        select(Recipe, func.count(Tag.id).label("match_count"))
        .join(Recipe.tags)
        .where(
            Recipe.user_id != user.id,
            Tag.name.in_(preferred_tags)
        )
        .group_by(Recipe.id)
        .order_by(func.count(Tag.id).desc())
        .limit(limit * 2)  # Get more than needed for deduplication
    ).all()

    # Copy matching recipes to user
    new_recipes = []
    seen_titles = set()

    for recipe_row in matching_recipes:
        original = recipe_row[0]
        if original.title in seen_titles:
            continue
        seen_titles.add(original.title)

        # Reload with relationships
        original = db.scalar(
            select(Recipe)
            .where(Recipe.id == original.id)
            .options(joinedload(Recipe.recipe_ingredients), joinedload(Recipe.tags))
        )

        new_recipe = _copy_recipe_to_user(db, original, user)
        new_recipes.append(new_recipe)

        if len(new_recipes) >= limit:
            break

    # If not enough matches, fill with popular recipes
    if len(new_recipes) < limit:
        remaining = limit - len(new_recipes)
        popular_recipes = db.scalars(
            select(Recipe)
            .where(
                Recipe.user_id != user.id,
                ~Recipe.title.in_(seen_titles) if seen_titles else True
            )
            .options(joinedload(Recipe.recipe_ingredients), joinedload(Recipe.tags))
            .limit(remaining)
        ).unique().all()

        for original in popular_recipes:
            new_recipe = _copy_recipe_to_user(db, original, user)
            new_recipes.append(new_recipe)

    return new_recipes


def _copy_recipe_to_user(db: Session, original: Recipe, user: User) -> Recipe:
    """Helper to copy a recipe to a user's collection."""
    new_recipe = Recipe(
        user_id=user.id,
        title=original.title,
        description=original.description,
        image_url=original.image_url,
        instructions=original.instructions
    )
    db.add(new_recipe)
    db.flush()

    # Copy ingredients
    for ri in original.recipe_ingredients:
        new_ri = RecipeIngredient(
            recipe_id=new_recipe.id,
            ingredient_id=ri.ingredient_id,
            quantity=ri.quantity,
            unit=ri.unit,
            note=ri.note
        )
        db.add(new_ri)

    # Copy tags - create user-specific tags
    for tag in original.tags:
        # Get or create tag for this user
        user_tag = db.scalar(
            select(Tag).where(Tag.user_id == user.id, Tag.name == tag.name)
        )
        if not user_tag:
            user_tag = Tag(user_id=user.id, name=tag.name)
            db.add(user_tag)
            db.flush()
        new_recipe.tags.append(user_tag)

    return new_recipe


def complete_onboarding(
    db: Session,
    user: User,
    diet_preferences: list[str],
    cuisine_preferences: list[str],
    recipe_limit: int = 10
) -> int:
    """
    Complete the onboarding process:
    1. Save preferences
    2. Assign personalized recipes
    3. Mark onboarding as complete

    Returns the number of recipes assigned.
    """
    # Save preferences
    save_preferences(db, user, diet_preferences, cuisine_preferences)

    # Assign recipes
    recipes = assign_personalized_recipes(db, user, recipe_limit)

    # Mark onboarding complete
    user.onboarding_completed = True
    db.commit()

    return len(recipes)


def skip_onboarding(db: Session, user: User, recipe_limit: int = 10) -> int:
    """
    Skip onboarding and assign random starter recipes.
    """
    from app.services.starter_recipes import assign_starter_recipes

    recipes = assign_starter_recipes(db, user, recipe_limit)
    user.onboarding_completed = True
    db.commit()

    return len(recipes)
