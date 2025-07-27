from sqlalchemy import Column, Integer, String
from app.database import Base

class FormData(Base):
    __tablename__ = "form_data"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String)
    email = Column(String)
