from fastapi import FastAPI
from app.routes import your_api
from app.models import Base
from app.database import engine

app = FastAPI()
from fastapi import Depends
from sqlalchemy.orm import Session
from .database import get_db
from . import models  # make sure this import points to where your FormModel is defined

@app.get("/form")
def read_forms(db: Session = Depends(get_db)):
    return db.query(models.FormData).all()


# Create tables
Base.metadata.create_all(bind=engine)

# Include API routes
app.include_router(your_api.router)
