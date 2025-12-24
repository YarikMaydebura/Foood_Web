from sqlalchemy.orm import Session
from sqlalchemy import select
from app.models.tag import Tag


def list_tags_by_user(db: Session, user_id: int) -> list[Tag]:
    return list(db.scalars(
        select(Tag).where(Tag.user_id == user_id).order_by(Tag.name)
    ))


def get_tag(db: Session, tag_id: int) -> Tag | None:
    return db.scalar(select(Tag).where(Tag.id == tag_id))


def get_tag_by_name(db: Session, user_id: int, name: str) -> Tag | None:
    return db.scalar(
        select(Tag).where(Tag.user_id == user_id, Tag.name == name)
    )


def create_tag(db: Session, user_id: int, name: str) -> Tag:
    tag = Tag(user_id=user_id, name=name)
    db.add(tag)
    db.commit()
    db.refresh(tag)
    return tag


def get_or_create_tag(db: Session, user_id: int, name: str) -> Tag:
    """Get existing tag by name or create new one for user"""
    tag = get_tag_by_name(db, user_id, name)
    if not tag:
        tag = create_tag(db, user_id, name)
    return tag


def update_tag(db: Session, tag: Tag, name: str) -> Tag:
    tag.name = name
    db.commit()
    db.refresh(tag)
    return tag


def delete_tag(db: Session, tag: Tag) -> None:
    db.delete(tag)
    db.commit()


def get_tags_by_ids(db: Session, user_id: int, tag_ids: list[int]) -> list[Tag]:
    """Get multiple tags by their IDs, filtered by user"""
    if not tag_ids:
        return []
    return list(db.scalars(
        select(Tag).where(Tag.id.in_(tag_ids), Tag.user_id == user_id)
    ))
