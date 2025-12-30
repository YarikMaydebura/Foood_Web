from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.api.deps import get_db, get_current_user
from app.models.user import User
from app.schemas.tag import TagCreate, TagUpdate, TagOut
from app.crud import tag as crud_tag

router = APIRouter(prefix="/tags", tags=["tags"])


@router.get("", response_model=list[TagOut])
def list_tags(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Get all tags for the current user"""
    return crud_tag.list_tags_by_user(db, current_user.id)


@router.get("/{tag_id}", response_model=TagOut)
def get_tag(
    tag_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Get a specific tag by ID"""
    tag = crud_tag.get_tag(db, tag_id)
    if not tag or tag.user_id != current_user.id:
        raise HTTPException(status_code=404, detail="Tag not found")
    return tag


@router.post("", response_model=TagOut, status_code=201)
def create_tag(
    body: TagCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Create a new tag"""
    # Check if tag already exists for this user
    existing = crud_tag.get_tag_by_name(db, current_user.id, body.name)
    if existing:
        raise HTTPException(status_code=400, detail="Tag already exists")
    return crud_tag.create_tag(db, current_user.id, body.name)


@router.put("/{tag_id}", response_model=TagOut)
def update_tag(
    tag_id: int,
    body: TagUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Update a tag"""
    tag = crud_tag.get_tag(db, tag_id)
    if not tag or tag.user_id != current_user.id:
        raise HTTPException(status_code=404, detail="Tag not found")
    if body.name:
        return crud_tag.update_tag(db, tag, body.name)
    return tag


@router.delete("/{tag_id}")
def delete_tag(
    tag_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Delete a tag"""
    tag = crud_tag.get_tag(db, tag_id)
    if not tag or tag.user_id != current_user.id:
        raise HTTPException(status_code=404, detail="Tag not found")
    crud_tag.delete_tag(db, tag)
    return {"ok": True}
