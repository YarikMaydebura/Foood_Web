from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import select, func
from sqlalchemy.orm import Session, joinedload

from app.api.deps import get_db, get_current_user, get_optional_current_user
from app.models.user import User
from app.models.recipe import Recipe
from app.models.recipe_review import RecipeReview
from app.schemas.review import ReviewCreate, ReviewOut, ReviewSummary


router = APIRouter(prefix="/recipes/{recipe_id}/reviews", tags=["reviews"])


def _serialize_review(review: RecipeReview) -> dict:
    author = getattr(review, "user", None)
    return {
        "id": review.id,
        "recipe_id": review.recipe_id,
        "user_id": review.user_id,
        "rating": review.rating,
        "comment": review.comment,
        "created_at": review.created_at,
        "updated_at": review.updated_at,
        "author_name": author.name if author else None,
    }


def _require_recipe(db: Session, recipe_id: int) -> Recipe:
    recipe = db.scalar(select(Recipe).where(Recipe.id == recipe_id))
    if not recipe:
        raise HTTPException(status_code=404, detail="Recipe not found")
    return recipe


@router.get("", response_model=list[ReviewOut])
def list_reviews(
    recipe_id: int,
    db: Session = Depends(get_db),
):
    """Reviews are public — anyone can read."""
    _require_recipe(db, recipe_id)
    reviews = db.scalars(
        select(RecipeReview)
        .where(RecipeReview.recipe_id == recipe_id)
        .options(joinedload(RecipeReview.user))
        .order_by(RecipeReview.created_at.desc())
    ).all()
    return [_serialize_review(r) for r in reviews]


@router.get("/summary", response_model=ReviewSummary)
def review_summary(
    recipe_id: int,
    db: Session = Depends(get_db),
):
    _require_recipe(db, recipe_id)
    row = db.execute(
        select(func.avg(RecipeReview.rating), func.count(RecipeReview.id))
        .where(RecipeReview.recipe_id == recipe_id)
    ).one()
    avg, count = row
    return ReviewSummary(average=float(avg) if avg is not None else None, count=count or 0)


@router.get("/me", response_model=ReviewOut | None)
def get_my_review(
    recipe_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    review = db.scalar(
        select(RecipeReview)
        .where(RecipeReview.recipe_id == recipe_id, RecipeReview.user_id == current_user.id)
        .options(joinedload(RecipeReview.user))
    )
    return _serialize_review(review) if review else None


@router.post("", response_model=ReviewOut, status_code=201)
def upsert_review(
    recipe_id: int,
    body: ReviewCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    """Create a review, or update yours if one already exists for this recipe."""
    _require_recipe(db, recipe_id)
    existing = db.scalar(
        select(RecipeReview)
        .where(RecipeReview.recipe_id == recipe_id, RecipeReview.user_id == current_user.id)
    )
    comment = (body.comment or "").strip() or None
    if existing:
        existing.rating = body.rating
        existing.comment = comment
        db.commit()
        db.refresh(existing)
        review = existing
    else:
        review = RecipeReview(
            recipe_id=recipe_id,
            user_id=current_user.id,
            rating=body.rating,
            comment=comment,
        )
        db.add(review)
        db.commit()
        db.refresh(review)
    # Eager-load user for the response.
    review = db.scalar(
        select(RecipeReview)
        .where(RecipeReview.id == review.id)
        .options(joinedload(RecipeReview.user))
    )
    return _serialize_review(review)


@router.delete("/me", status_code=204)
def delete_my_review(
    recipe_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    review = db.scalar(
        select(RecipeReview)
        .where(RecipeReview.recipe_id == recipe_id, RecipeReview.user_id == current_user.id)
    )
    if not review:
        raise HTTPException(status_code=404, detail="No review to delete")
    db.delete(review)
    db.commit()
    return None
