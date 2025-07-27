from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routes import your_api
from app.models import Base, FormData, WheelSpecification, BogieChecksheet
from app.database import engine

app = FastAPI()

# Enable CORS for all origins (for development)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Create tables for all models
Base.metadata.create_all(bind=engine)

# Include API routes with /api prefix
app.include_router(your_api.router, prefix="/api")
