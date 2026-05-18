from datetime import datetime
from pydantic import BaseModel, Field


class ReviewCreate(BaseModel):
    rating: int = Field(ge=1, le=5)
    comment: str | None = Field(default=None, max_length=500)


class ReviewOut(BaseModel):
    id: int
    recipe_id: int
    user_id: int
    rating: int
    comment: str | None
    created_at: datetime
    updated_at: datetime
    author_name: str | None = None

    class Config:
        from_attributes = True


class ReviewSummary(BaseModel):
    average: float | None
    count: int
