from sqlalchemy import String, Text, Integer, DateTime, ForeignKey, Index, func, Numeric, Boolean
from sqlalchemy.orm import Mapped, mapped_column, relationship
from datetime import datetime
from app.db.base import Base


class Recipe(Base):
    __tablename__ = "recipes"
    __table_args__ = (
        Index("ix_recipes_user_id", "user_id"),
        Index("ix_recipes_user_id_title", "user_id", "title"),
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    user_id: Mapped[int] = mapped_column(Integer, ForeignKey("users.id"), nullable=False)
    title: Mapped[str] = mapped_column(String(255), nullable=False)
    description: Mapped[str | None] = mapped_column(Text, nullable=True)
    image_url: Mapped[str | None] = mapped_column(String(500), nullable=True)
    instructions: Mapped[str] = mapped_column(Text, nullable=False)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now(), nullable=False)
    updated_at: Mapped[datetime | None] = mapped_column(DateTime(timezone=True), onupdate=func.now(), nullable=True)

    # Nutritional information per serving
    calories: Mapped[int | None] = mapped_column(Integer, nullable=True)
    protein_g: Mapped[float | None] = mapped_column(Numeric(6, 2), nullable=True)
    carbs_g: Mapped[float | None] = mapped_column(Numeric(6, 2), nullable=True)
    fat_g: Mapped[float | None] = mapped_column(Numeric(6, 2), nullable=True)
    fiber_g: Mapped[float | None] = mapped_column(Numeric(6, 2), nullable=True)
    sugar_g: Mapped[float | None] = mapped_column(Numeric(6, 2), nullable=True)
    sodium_mg: Mapped[float | None] = mapped_column(Numeric(6, 2), nullable=True)
    cholesterol_mg: Mapped[float | None] = mapped_column(Numeric(6, 2), nullable=True)
    servings: Mapped[int] = mapped_column(Integer, default=4, nullable=False)

    # Recipe metadata
    slug: Mapped[str | None] = mapped_column(String(255), unique=True, nullable=True)
    is_public: Mapped[bool] = mapped_column(Boolean, default=False, nullable=False)
    source: Mapped[str | None] = mapped_column(String(50), default="user", nullable=True)
    prep_time_minutes: Mapped[int | None] = mapped_column(Integer, nullable=True)
    cook_time_minutes: Mapped[int | None] = mapped_column(Integer, nullable=True)
    difficulty: Mapped[str | None] = mapped_column(String(20), nullable=True)
    cuisine: Mapped[str | None] = mapped_column(String(100), nullable=True)
    category: Mapped[str | None] = mapped_column(String(50), default="meal", nullable=True)

    # Relationships
    user: Mapped["User"] = relationship("User", back_populates="recipes")
    recipe_ingredients: Mapped[list["RecipeIngredient"]] = relationship(
        "RecipeIngredient", back_populates="recipe", cascade="all, delete-orphan"
    )
    tags: Mapped[list["Tag"]] = relationship(
        "Tag", secondary="recipe_tags", back_populates="recipes"
    )
    meal_plan_entries: Mapped[list["MealPlanEntry"]] = relationship(
        "MealPlanEntry", back_populates="recipe"
    )
