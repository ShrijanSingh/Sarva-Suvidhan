from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, Session


# Update to use PostgreSQL
DATABASE_URL = "postgresql://postgres:root%40123@localhost:5432/kpadb"  # Update user/password as needed

engine = create_engine(
    DATABASE_URL
)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

# ✅ This is the function you need
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
