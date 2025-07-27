from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.database import SessionLocal, engine
from app.models import FormData, WheelSpecification, BogieChecksheet, UserTable
from app.schemas import (
    FormDataCreate, FormDataResponse,
    WheelSpecificationCreate, WheelSpecificationResponse,
    BogieChecksheetCreate, BogieChecksheetResponse
)

from fastapi import HTTPException
from pydantic import BaseModel

router = APIRouter()


# Accept 'phone' instead of 'username' for login
class LoginRequest(BaseModel):
    phone: str
    password: str

class LoginResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"


# Dependency to get DB session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


# Login endpoint that checks usertable
@router.post("/users/login/", response_model=LoginResponse)
def login(request: LoginRequest, db: Session = Depends(get_db)):
    user = db.query(UserTable).filter_by(phone_no=request.phone, password=request.password).first()
    if user:
        return LoginResponse(access_token="dummy_token")
    raise HTTPException(status_code=401, detail="Invalid phone or password")


# FormData endpoint (existing)
@router.post("/form", response_model=FormDataResponse)
def create_form(data: FormDataCreate, db: Session = Depends(get_db)):
    new_data = FormData(name=data.name, email=data.email)
    db.add(new_data)
    db.commit()
    db.refresh(new_data)
    return new_data

# WheelSpecification endpoints
@router.post("/wheelspecification", response_model=WheelSpecificationResponse)
def create_wheel_specification(data: WheelSpecificationCreate, db: Session = Depends(get_db)):
    new_data = WheelSpecification(**data.dict())
    db.add(new_data)
    db.commit()
    db.refresh(new_data)
    return new_data

@router.get("/wheelspecification", response_model=list[WheelSpecificationResponse])
def get_wheel_specifications(db: Session = Depends(get_db)):
    return db.query(WheelSpecification).all()

# BogieChecksheet endpoints
@router.post("/bogiechecksheet", response_model=BogieChecksheetResponse)
def create_bogie_checksheet(data: BogieChecksheetCreate, db: Session = Depends(get_db)):
    new_data = BogieChecksheet(**data.dict())
    db.add(new_data)
    db.commit()
    db.refresh(new_data)
    return new_data

@router.get("/bogiechecksheet", response_model=list[BogieChecksheetResponse])
def get_bogie_checksheet(db: Session = Depends(get_db)):
    return db.query(BogieChecksheet).all()
