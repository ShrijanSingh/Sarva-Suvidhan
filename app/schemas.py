from pydantic import BaseModel

class FormDataCreate(BaseModel):
    name: str
    email: str

class FormDataResponse(FormDataCreate):
    id: int
