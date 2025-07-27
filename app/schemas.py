from pydantic import BaseModel


class FormDataCreate(BaseModel):
    name: str
    email: str

class FormDataResponse(FormDataCreate):
    id: int


# WheelSpecification Schemas
from typing import Optional
from datetime import date

class WheelSpecificationBase(BaseModel):
    @classmethod
    def __get_validators__(cls):
        yield from super().__get_validators__()
        yield cls.parse_dates

    @classmethod
    def parse_dates(cls, values):
        from datetime import datetime, date
        for field in ['submitted_date']:
            v = values.get(field)
            if v and isinstance(v, str):
                try:
                    values[field] = datetime.strptime(v, '%Y-%m-%d').date()
                except Exception:
                    pass
        return values
    form_number: str
    submitted_by: str
    submitted_date: date
    tread_diameter_new: Optional[str] = None
    last_shop_issue_size: Optional[str] = None
    condemning_dia: Optional[str] = None
    wheel_gauge: Optional[str] = None
    variation_same_axle: Optional[str] = None
    variation_same_bogie: Optional[str] = None
    variation_same_coach: Optional[str] = None
    wheel_profile: Optional[str] = None
    intermediate_wwp: Optional[str] = None
    bearing_seat_diameter: Optional[str] = None
    roller_bearing_outer_dia: Optional[str] = None
    roller_bearing_bore_dia: Optional[str] = None
    roller_bearing_width: Optional[str] = None
    axle_box_housing_bore_dia: Optional[str] = None
    wheel_disc_width: Optional[str] = None

class WheelSpecificationCreate(WheelSpecificationBase):
    pass

class WheelSpecificationResponse(WheelSpecificationBase):
    id: int

    class Config:
        orm_mode = True

# BogieChecksheet Schemas
class BogieChecksheetBase(BaseModel):
    @classmethod
    def __get_validators__(cls):
        yield from super().__get_validators__()
        yield cls.parse_dates

    @classmethod
    def parse_dates(cls, values):
        from datetime import datetime, date
        for field in ['inspection_date', 'date_of_ioh']:
            v = values.get(field)
            if v and isinstance(v, str):
                try:
                    values[field] = datetime.strptime(v, '%Y-%m-%d').date()
                except Exception:
                    pass
        return values
    form_number: str
    inspection_by: str
    inspection_date: date
    bogie_no: Optional[str] = None
    maker_year_built: Optional[str] = None
    incoming_div_and_date: Optional[str] = None
    deficit_components: Optional[str] = None
    date_of_ioh: Optional[date] = None
    bogie_frame_condition: Optional[str] = None
    bolster: Optional[str] = None
    bolster_suspension_bracket: Optional[str] = None
    lower_spring_seat: Optional[str] = None
    axle_guide: Optional[str] = None
    axle_guide_assembly: Optional[str] = None
    protective_tubes: Optional[str] = None
    anchor_links: Optional[str] = None
    side_bearer: Optional[str] = None
    cylinder_body: Optional[str] = None
    piston_trunnion: Optional[str] = None
    adjusting_tube: Optional[str] = None
    plunger_spring: Optional[str] = None
    tee_bolt_hex_nut: Optional[str] = None
    pawl_and_pawl_spring: Optional[str] = None
    dust_excluder: Optional[str] = None

class BogieChecksheetCreate(BogieChecksheetBase):
    pass

class BogieChecksheetResponse(BogieChecksheetBase):
    id: int

    class Config:
        orm_mode = True
