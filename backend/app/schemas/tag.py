from pydantic import BaseModel


class TagCreate(BaseModel):
    name: str


class TagUpdate(BaseModel):
    name: str | None = None


class TagOut(BaseModel):
    id: int
    user_id: int
    name: str

    class Config:
        from_attributes = True
