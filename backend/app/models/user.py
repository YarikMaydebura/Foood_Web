from sqlalchemy import String, DateTime, Integer, func
from sqlalchemy.orm import Mapped, mapped_column, relationship
from datetime import datetime
from app.db.base import Base


class User(Base):
    __tablename__ = "users"

    # Changed from BigInteger to Integer for SQLite autoincrement compatibility
    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    # Added name field to store user's full name
    name: Mapped[str] = mapped_column(String(255), nullable=False)
    email: Mapped[str] = mapped_column(String(255), unique=True, index=True, nullable=False)
    password_hash: Mapped[str] = mapped_column(String(255), nullable=False)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now(), nullable=False)

    # Relationships
    recipes: Mapped[list["Recipe"]] = relationship("Recipe", back_populates="user", cascade="all, delete-orphan")
    tags: Mapped[list["Tag"]] = relationship("Tag", back_populates="user", cascade="all, delete-orphan")
    meal_plan_entries: Mapped[list["MealPlanEntry"]] = relationship(
        "MealPlanEntry", back_populates="user", cascade="all, delete-orphan"
    )
    shopping_lists: Mapped[list["ShoppingList"]] = relationship(
        "ShoppingList", back_populates="user", cascade="all, delete-orphan"
    )
