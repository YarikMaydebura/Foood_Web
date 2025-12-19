from sqlalchemy import BigInteger, ForeignKey, Date, DateTime, UniqueConstraint, func
from sqlalchemy.orm import Mapped, mapped_column, relationship
from datetime import date, datetime
from app.db.base import Base


class ShoppingList(Base):
    __tablename__ = "shopping_lists"
    __table_args__ = (
        UniqueConstraint("user_id", "week_start_date", name="uq_shopping_lists_user_id_week_start_date"),
    )

    id: Mapped[int] = mapped_column(BigInteger, primary_key=True, autoincrement=True)
    user_id: Mapped[int] = mapped_column(BigInteger, ForeignKey("users.id"), nullable=False)
    week_start_date: Mapped[date] = mapped_column(Date, nullable=False)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now(), nullable=False)

    # Relationships
    user: Mapped["User"] = relationship("User", back_populates="shopping_lists")
    items: Mapped[list["ShoppingListItem"]] = relationship(
        "ShoppingListItem", back_populates="shopping_list", cascade="all, delete-orphan"
    )
