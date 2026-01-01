from sqlalchemy import Integer, ForeignKey, Table, Column, Index
from app.db.base import Base

# Association table for many-to-many relationship between recipes and tags
recipe_tags = Table(
    "recipe_tags",
    Base.metadata,
    Column("recipe_id", Integer, ForeignKey("recipes.id", ondelete="CASCADE"), primary_key=True, nullable=False),
    Column("tag_id", Integer, ForeignKey("tags.id", ondelete="CASCADE"), primary_key=True, nullable=False),
    Index("ix_recipe_tags_tag_id", "tag_id"),
)
