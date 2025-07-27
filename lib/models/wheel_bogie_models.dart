class WheelSpecificationModel {
  final String formNumber;
  final String submittedBy;
  final String submittedDate;
  final String treadDiameterNew;
  final String lastShopIssueSize;
  final String condemningDia;
  final String wheelGauge;
  final String variationSameAxle;
  final String variationSameBogie;
  final String variationSameCoach;
  final String wheelProfile;
  final String intermediateWwp;
  final String bearingSeatDiameter;
  final String rollerBearingOuterDia;
  final String rollerBearingBoreDia;
  final String rollerBearingWidth;
  final String axleBoxHousingBoreDia;
  final String wheelDiscWidth;

  WheelSpecificationModel({
    required this.formNumber,
    required this.submittedBy,
    required this.submittedDate,
    required this.treadDiameterNew,
    required this.lastShopIssueSize,
    required this.condemningDia,
    required this.wheelGauge,
    required this.variationSameAxle,
    required this.variationSameBogie,
    required this.variationSameCoach,
    required this.wheelProfile,
    required this.intermediateWwp,
    required this.bearingSeatDiameter,
    required this.rollerBearingOuterDia,
    required this.rollerBearingBoreDia,
    required this.rollerBearingWidth,
    required this.axleBoxHousingBoreDia,
    required this.wheelDiscWidth,
  });

  Map<String, dynamic> toJson() => {
        'form_number': formNumber,
        'submitted_by': submittedBy,
        'submitted_date': submittedDate,
        'tread_diameter_new': treadDiameterNew,
        'last_shop_issue_size': lastShopIssueSize,
        'condemning_dia': condemningDia,
        'wheel_gauge': wheelGauge,
        'variation_same_axle': variationSameAxle,
        'variation_same_bogie': variationSameBogie,
        'variation_same_coach': variationSameCoach,
        'wheel_profile': wheelProfile,
        'intermediate_wwp': intermediateWwp,
        'bearing_seat_diameter': bearingSeatDiameter,
        'roller_bearing_outer_dia': rollerBearingOuterDia,
        'roller_bearing_bore_dia': rollerBearingBoreDia,
        'roller_bearing_width': rollerBearingWidth,
        'axle_box_housing_bore_dia': axleBoxHousingBoreDia,
        'wheel_disc_width': wheelDiscWidth,
      };
}

class BogieChecksheetModel {
  final String formNumber;
  final String inspectionBy;
  final String inspectionDate;
  final String bogieNo;
  final String makerYearBuilt;
  final String incomingDivAndDate;
  final String deficitComponents;
  final String dateOfIoh;
  final String bogieFrameCondition;
  final String bolster;
  final String bolsterSuspensionBracket;
  final String lowerSpringSeat;
  final String axleGuide;
  final String axleGuideAssembly;
  final String protectiveTubes;
  final String anchorLinks;
  final String sideBearer;
  final String cylinderBody;
  final String pistonTrunnion;
  final String adjustingTube;
  final String plungerSpring;
  final String teeBoltHexNut;
  final String pawlAndPawlSpring;
  final String dustExcluder;

  BogieChecksheetModel({
    required this.formNumber,
    required this.inspectionBy,
    required this.inspectionDate,
    required this.bogieNo,
    required this.makerYearBuilt,
    required this.incomingDivAndDate,
    required this.deficitComponents,
    required this.dateOfIoh,
    required this.bogieFrameCondition,
    required this.bolster,
    required this.bolsterSuspensionBracket,
    required this.lowerSpringSeat,
    required this.axleGuide,
    required this.axleGuideAssembly,
    required this.protectiveTubes,
    required this.anchorLinks,
    required this.sideBearer,
    required this.cylinderBody,
    required this.pistonTrunnion,
    required this.adjustingTube,
    required this.plungerSpring,
    required this.teeBoltHexNut,
    required this.pawlAndPawlSpring,
    required this.dustExcluder,
  });

  Map<String, dynamic> toJson() => {
        'form_number': formNumber,
        'inspection_by': inspectionBy,
        'inspection_date': inspectionDate,
        'bogie_no': bogieNo,
        'maker_year_built': makerYearBuilt,
        'incoming_div_and_date': incomingDivAndDate,
        'deficit_components': deficitComponents,
        'date_of_ioh': dateOfIoh,
        'bogie_frame_condition': bogieFrameCondition,
        'bolster': bolster,
        'bolster_suspension_bracket': bolsterSuspensionBracket,
        'lower_spring_seat': lowerSpringSeat,
        'axle_guide': axleGuide,
        'axle_guide_assembly': axleGuideAssembly,
        'protective_tubes': protectiveTubes,
        'anchor_links': anchorLinks,
        'side_bearer': sideBearer,
        'cylinder_body': cylinderBody,
        'piston_trunnion': pistonTrunnion,
        'adjusting_tube': adjustingTube,
        'plunger_spring': plungerSpring,
        'tee_bolt_hex_nut': teeBoltHexNut,
        'pawl_and_pawl_spring': pawlAndPawlSpring,
        'dust_excluder': dustExcluder,
      };
}
