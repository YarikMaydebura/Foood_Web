from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import select

from app.api.deps import get_db, get_current_user
from app.models.user import User
from app.schemas.auth import LoginIn, RegisterIn
from app.core.security import verify_password, hash_password, create_access_token

router = APIRouter(prefix="/auth", tags=["auth"])

def _user_out(user: User) -> dict:
    # Generate JWT token for Session 2 authentication
    access_token = create_access_token(user.email)
    return {
        "user": {"id": user.id, "name": getattr(user, "name", None), "email": user.email},
        "access_token": access_token
    }

@router.post("/signup")
def signup(body: RegisterIn, db: Session = Depends(get_db)):
    exists = db.scalar(select(User).where(User.email == body.email))
    if exists:
        raise HTTPException(status_code=400, detail="Email already registered")

    # Create User instance as I had trouble creating a dummy account
    user = User(
        name=body.name,
        email=body.email,
        password_hash=hash_password(body.password)
    )

    db.add(user)
    db.commit()
    db.refresh(user)
    return _user_out(user)

@router.post("/login")
def login(body: LoginIn, db: Session = Depends(get_db)):
    user = db.scalar(select(User).where(User.email == body.email))
    if not user or not verify_password(body.password, user.password_hash):
        raise HTTPException(status_code=401, detail="Invalid credentials")
    return _user_out(user)

@router.get("/me")
def get_me(current_user: User = Depends(get_current_user)):
    """Get current authenticated user info"""
    return {
        "user": {
            "id": current_user.id,
            "name": getattr(current_user, "name", None),
            "email": current_user.email
        }
    }
