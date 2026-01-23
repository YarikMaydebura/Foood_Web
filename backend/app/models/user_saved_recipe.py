from sqlalchemy import Column, Integer, ForeignKey, DateTime, Text, func
from sqlalchemy.orm import relationship

from app.db.base import Base


class UserSavedRecipe(Base):
    """
    Junction table for users saving/bookmarking library recipes.
    This allows users to save recipes without copying them.
    """
    __tablename__ = "user_saved_recipes"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    recipe_id = Column(Integer, ForeignKey("recipes.id", ondelete="CASCADE"), nullable=False)
    saved_at = Column(DateTime(timezone=True), server_default=func.now())
    notes = Column(Text, nullable=True)  # Personal notes about the recipe
    rating = Column(Integer, nullable=True)  # Personal rating 1-5

    # Relationships
    user = relationship("User", back_populates="saved_recipes")
    recipe = relationship("Recipe", back_populates="saved_by_users")
