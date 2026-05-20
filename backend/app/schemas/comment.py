from datetime import datetime
from pydantic import BaseModel, Field


class CommentCreate(BaseModel):
    text: str = Field(min_length=1, max_length=2000)
    parent_id: int | None = None


class CommentOut(BaseModel):
    id: int
    recipe_id: int
    user_id: int
    parent_id: int | None
    text: str
    created_at: datetime
    updated_at: datetime
    author_name: str | None = None
    replies: list["CommentOut"] = []

    class Config:
        from_attributes = True


CommentOut.model_rebuild()
