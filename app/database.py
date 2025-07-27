from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, Session

DATABASE_URL = "sqlite:///./test.db"  # or your actual database URL

engine = create_engine(
    DATABASE_URL, connect_args={"check_same_thread": False}  # only for SQLite
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
