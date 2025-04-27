from sqlalchemy import Column, Integer, String # type: ignore
from app.database import Base, engine  # ✅ Import `engine` for table creation

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String, unique=True, nullable=False)
    email = Column(String, unique=True, nullable=False)
    password = Column(String, nullable=False)

# ✅ Ensure tables are created
def create_database():
    print("Creating database tables...")
    Base.metadata.create_all(bind=engine)
    print("Database setup completed.")
