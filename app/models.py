from sqlalchemy import Column, Integer, String, Date
from app.database import Base

class UserTable(Base):
    __tablename__ = "usertable"

    id = Column(Integer, primary_key=True, index=True)
    phone_no = Column(String, unique=True, index=True, nullable=False)
    password = Column(String, nullable=False)

class FormData(Base):
    __tablename__ = "form_data"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String)
    email = Column(String)

class WheelSpecification(Base):
    __tablename__ = "wheelspecification"

    id = Column(Integer, primary_key=True, index=True)
    form_number = Column(String)
    submitted_by = Column(String)
    submitted_date = Column(Date)
    tread_diameter_new = Column(String)
    last_shop_issue_size = Column(String)
    condemning_dia = Column(String)
    wheel_gauge = Column(String)
    variation_same_axle = Column(String)
    variation_same_bogie = Column(String)
    variation_same_coach = Column(String)
    wheel_profile = Column(String)
    intermediate_wwp = Column(String)
    bearing_seat_diameter = Column(String)
    roller_bearing_outer_dia = Column(String)
    roller_bearing_bore_dia = Column(String)
    roller_bearing_width = Column(String)
    axle_box_housing_bore_dia = Column(String)
    wheel_disc_width = Column(String)

class BogieChecksheet(Base):
    __tablename__ = "bogiechecksheet"

    id = Column(Integer, primary_key=True, index=True)
    form_number = Column(String)
    inspection_by = Column(String)
    inspection_date = Column(Date)
    bogie_no = Column(String)
    maker_year_built = Column(String)
    incoming_div_and_date = Column(String)
    deficit_components = Column(String)
    date_of_ioh = Column(Date)
    bogie_frame_condition = Column(String)
    bolster = Column(String)
    bolster_suspension_bracket = Column(String)
    lower_spring_seat = Column(String)
    axle_guide = Column(String)
    axle_guide_assembly = Column(String)
    protective_tubes = Column(String)
    anchor_links = Column(String)
    side_bearer = Column(String)
    cylinder_body = Column(String)
    piston_trunnion = Column(String)
    adjusting_tube = Column(String)
    plunger_spring = Column(String)
    tee_bolt_hex_nut = Column(String)
    pawl_and_pawl_spring = Column(String)
    dust_excluder = Column(String)
