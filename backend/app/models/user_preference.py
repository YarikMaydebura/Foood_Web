from sqlalchemy import String, Integer, ForeignKey, Index, UniqueConstraint
from sqlalchemy.orm import Mapped, mapped_column, relationship
from app.db.base import Base
import enum


class PreferenceType(str, enum.Enum):
    DIET = "diet"
    CUISINE = "cuisine"


class UserPreference(Base):
    __tablename__ = "user_preferences"
    __table_args__ = (
        Index("ix_user_preferences_user_id", "user_id"),
        UniqueConstraint("user_id", "preference_type", "tag_name", name="uq_user_preferences_user_type_tag"),
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    user_id: Mapped[int] = mapped_column(
        Integer, ForeignKey("users.id", ondelete="CASCADE"), nullable=False
    )
    preference_type: Mapped[str] = mapped_column(String(20), nullable=False)
    tag_name: Mapped[str] = mapped_column(String(100), nullable=False)

    # Relationship
    user: Mapped["User"] = relationship("User", back_populates="preferences")
