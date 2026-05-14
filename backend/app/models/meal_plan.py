from sqlalchemy import Integer, SmallInteger, ForeignKey, Date, DateTime, String, Index, func, JSON
from sqlalchemy.orm import Mapped, mapped_column, relationship
from datetime import date, datetime
from app.db.base import Base


class MealPlan(Base):
    """Simple meal plan model for storing weekly meal plans as JSON"""
    __tablename__ = "meal_plans"

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    plan: Mapped[dict] = mapped_column(JSON, nullable=False, default=dict)


class MealPlanEntry(Base):
    __tablename__ = "meal_plan_entries"
    __table_args__ = (
        Index("ix_meal_plan_entries_user_id", "user_id"),
        Index("ix_meal_plan_entries_user_id_week_start_date", "user_id", "week_start_date"),
        Index("ix_meal_plan_entries_slot", "user_id", "week_start_date", "day_of_week", "meal_slot"),
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    user_id: Mapped[int] = mapped_column(Integer, ForeignKey("users.id"), nullable=False)
    week_start_date: Mapped[date] = mapped_column(Date, nullable=False)
    day_of_week: Mapped[int] = mapped_column(Integer, nullable=False)
    meal_slot: Mapped[str] = mapped_column(String(50), nullable=False)
    recipe_id: Mapped[int] = mapped_column(Integer, ForeignKey("recipes.id"), nullable=False)
    position: Mapped[int] = mapped_column(SmallInteger, nullable=False, default=0)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now(), nullable=False)

    user: Mapped["User"] = relationship("User", back_populates="meal_plan_entries")
    recipe: Mapped["Recipe"] = relationship("Recipe", back_populates="meal_plan_entries")
