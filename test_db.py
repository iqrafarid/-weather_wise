from sqlalchemy import create_engine # type: ignore

DATABASE_URL =  "postgresql://weatherwise:ROOT@localhost:5432/weather_db"

engine = create_engine(DATABASE_URL)

try:
    with engine.connect() as connection:
        print("Connection successful!")
except Exception as e:
    print(f"Connection failed: {e}")