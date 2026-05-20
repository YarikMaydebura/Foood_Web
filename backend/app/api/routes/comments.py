from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import select
from sqlalchemy.orm import Session, joinedload

from app.api.deps import get_db, get_current_user
from app.models.user import User
from app.models.recipe import Recipe
from app.models.recipe_comment import RecipeComment
from app.schemas.comment import CommentCreate, CommentOut


router = APIRouter(prefix="/recipes/{recipe_id}/comments", tags=["comments"])


def _serialize(comment: RecipeComment, replies: list[dict] | None = None) -> dict:
    author = getattr(comment, "user", None)
    return {
        "id": comment.id,
        "recipe_id": comment.recipe_id,
        "user_id": comment.user_id,
        "parent_id": comment.parent_id,
        "text": comment.text,
        "created_at": comment.created_at,
        "updated_at": comment.updated_at,
        "author_name": author.name if author else None,
        "replies": replies or [],
    }


def _require_recipe(db: Session, recipe_id: int) -> Recipe:
    recipe = db.scalar(select(Recipe).where(Recipe.id == recipe_id))
    if not recipe:
        raise HTTPException(status_code=404, detail="Recipe not found")
    return recipe


@router.get("", response_model=list[CommentOut])
def list_comments(
    recipe_id: int,
    db: Session = Depends(get_db),
):
    """Return the comment tree as a list of top-level comments, each with
    its replies nested. One level of nesting only."""
    _require_recipe(db, recipe_id)
    rows = db.scalars(
        select(RecipeComment)
        .where(RecipeComment.recipe_id == recipe_id)
        .options(joinedload(RecipeComment.user))
        .order_by(RecipeComment.created_at.asc())
    ).all()

    by_parent: dict[int, list[RecipeComment]] = {}
    top: list[RecipeComment] = []
    for c in rows:
        if c.parent_id is None:
            top.append(c)
        else:
            by_parent.setdefault(c.parent_id, []).append(c)

    return [
        _serialize(c, [_serialize(r) for r in by_parent.get(c.id, [])])
        for c in top
    ]


@router.post("", response_model=CommentOut, status_code=201)
def create_comment(
    recipe_id: int,
    body: CommentCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    _require_recipe(db, recipe_id)
    text = body.text.strip()
    if not text:
        raise HTTPException(status_code=400, detail="Comment cannot be empty")

    parent_id = body.parent_id
    if parent_id is not None:
        # Enforce one level of nesting: parent must itself be a top-level
        # comment on this recipe.
        parent = db.scalar(
            select(RecipeComment).where(RecipeComment.id == parent_id)
        )
        if not parent or parent.recipe_id != recipe_id:
            raise HTTPException(status_code=400, detail="Invalid parent comment")
        if parent.parent_id is not None:
            raise HTTPException(
                status_code=400,
                detail="Replies can only be added to top-level comments",
            )

    comment = RecipeComment(
        recipe_id=recipe_id,
        user_id=current_user.id,
        parent_id=parent_id,
        text=text,
    )
    db.add(comment)
    db.commit()
    db.refresh(comment)
    # Eager-load author for the response.
    comment = db.scalar(
        select(RecipeComment)
        .where(RecipeComment.id == comment.id)
        .options(joinedload(RecipeComment.user))
    )
    return _serialize(comment)


@router.delete("/{comment_id}", status_code=204)
def delete_comment(
    recipe_id: int,
    comment_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    comment = db.scalar(
        select(RecipeComment).where(
            RecipeComment.id == comment_id,
            RecipeComment.recipe_id == recipe_id,
        )
    )
    if not comment:
        raise HTTPException(status_code=404, detail="Comment not found")
    if comment.user_id != current_user.id:
        raise HTTPException(status_code=403, detail="Not your comment")
    db.delete(comment)
    db.commit()
    return None
