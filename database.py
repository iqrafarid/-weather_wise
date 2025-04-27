from sqlalchemy import create_engine # type: ignore
from sqlalchemy.ext.declarative import declarative_base # type: ignore
from sqlalchemy.orm import sessionmaker # type: ignore

# ✅ Correct Database URL Format
DATABASE_URL = "postgresql://weatherwise:ROOT@localhost:5432/weather_app"

# ✅ Create SQLAlchemy Engine
engine = create_engine(DATABASE_URL, echo=True)  # `echo=True` for debugging queries

# ✅ Create a Configured "Session" Class
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# ✅ Create Base Class for ORM Models
Base = declarative_base()

# ✅ Dependency to Get the Database Session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# ✅ Create Database Tables
def create_database():
    print("Creating database tables...")
    Base.metadata.create_all(bind=engine)
    print("Database setup completed.")
