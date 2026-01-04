from sqlalchemy import Integer, ForeignKey, Numeric, String, Boolean, Index, UniqueConstraint
from sqlalchemy.orm import Mapped, mapped_column, relationship
from app.db.base import Base


class ShoppingListItem(Base):
    __tablename__ = "shopping_list_items"
    __table_args__ = (
        Index("ix_shopping_list_items_shopping_list_id", "shopping_list_id"),
        Index("ix_shopping_list_items_ingredient_id", "ingredient_id"),
        UniqueConstraint("shopping_list_id", "ingredient_id", name="uq_shopping_list_items_list_ingredient"),
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    shopping_list_id: Mapped[int] = mapped_column(
        Integer, ForeignKey("shopping_lists.id", ondelete="CASCADE"), nullable=False
    )
    ingredient_id: Mapped[int] = mapped_column(
        Integer, ForeignKey("ingredients.id"), nullable=False
    )
    total_quantity: Mapped[float | None] = mapped_column(Numeric(10, 2), nullable=True)
    unit: Mapped[str | None] = mapped_column(String(50), nullable=True)
    purchased: Mapped[bool] = mapped_column(Boolean, default=False, nullable=False)

    # Relationships
    shopping_list: Mapped["ShoppingList"] = relationship("ShoppingList", back_populates="items")
    ingredient: Mapped["Ingredient"] = relationship("Ingredient", back_populates="shopping_list_items")
