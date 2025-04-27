from fastapi import APIRouter, HTTPException, Depends, Form # type: ignore
from sqlalchemy.orm import Session # type: ignore
from app.schemas.user import UserCreate
from app.models import User
from app.database import get_db

router = APIRouter()

@router.post("/signup")
async def signup(
    username: str = Form(...), email: str = Form(...), password: str = Form(...), db: Session = Depends(get_db)
):
    # Check if the username already exists
    existing_user = db.query(User).filter(User.username == username).first()
    if existing_user:
        raise HTTPException(status_code=400, detail="Username already registered")
    
    # Create a new user instance
    new_user = User(username=username, email=email, password=password)
    
    # Add and commit the new user to the database
    db.add(new_user)
    db.commit()
    db.refresh(new_user)  # ✅ Refreshes instance with DB values

    return {"message": "User created successfully", "user": new_user}
