import 'package:flutter/material.dart';
import 'package:kpa_erp/models/wheel_bogie_models.dart';
import 'package:kpa_erp/services/api_services/wheel_bogie_api.dart';
class IcfWheelProvider extends ChangeNotifier {
  bool submitted = false;
  bool isEditing = false;
  bool showSummaryCard = false;
bool showFilterCard = false;  // for filter summary card

  final searchController = TextEditingController();
  final treadDiameterController = TextEditingController(text: "915 (900-1000)");
  final lastShopIssueController = TextEditingController(text: "837 (800-900)");
  final condemningDiaController = TextEditingController(text: "825 (800-900)");
  final wheelGaugeController = TextEditingController(text: "1600 (+2,-1)");
  final variationSameAxleController = TextEditingController();
  final variationSameBogieController = TextEditingController();
  final variationSameCoachController = TextEditingController();
  final wheelProfileController = TextEditingController();
  final intermediateWwpController = TextEditingController();
  final bearingSeatDiameterController = TextEditingController();
  final rollerBearingOuterDiaController = TextEditingController();
  final rollerBearingBoreDiaController = TextEditingController();
  final rollerBearingWidthController = TextEditingController();
  final axleBoxHousingBoreDiaController = TextEditingController();
  final wheelDiscWidthController = TextEditingController();

  final List<Map<String, Widget>> allFields = [];
  List<Map<String, Widget>> visibleFields = [];

  String filterFormNumber = '';
  String filterCreatedAt = '';
  String filterCreatedBy = '';

  void initializeFields(List<Map<String, Widget>> fields) {
    allFields.clear();
    allFields.addAll(fields);
    visibleFields = List.from(allFields);
    notifyListeners();
  }

  void filterFields(String query) {
    visibleFields = query.isEmpty
        ? List.from(allFields)
        : allFields
            .where((field) => field.keys.first.toLowerCase().contains(query.toLowerCase()))
            .toList();
    notifyListeners();
  }

  void applyFilter({String formNumber = '', String createdAt = '', String createdBy = ''}) {
    filterFormNumber = formNumber;
    filterCreatedAt = createdAt;
    filterCreatedBy = createdBy;

    // Example condition for demonstration, adjust logic according to your actual data
    showSummaryCard = formNumber.isNotEmpty || createdAt.isNotEmpty || createdBy.isNotEmpty;

    notifyListeners();
  }


  Future<void> handleSubmit(BuildContext context) async {
    final model = WheelSpecificationModel(
      formNumber: 'WHEEL-2025-001', // Example, replace with actual logic
      submittedBy: 'user_id_123',   // Example, replace with actual user
      submittedDate: DateTime.now().toIso8601String().split('T').first,
      treadDiameterNew: treadDiameterController.text,
      lastShopIssueSize: lastShopIssueController.text,
      condemningDia: condemningDiaController.text,
      wheelGauge: wheelGaugeController.text,
      variationSameAxle: variationSameAxleController.text,
      variationSameBogie: variationSameBogieController.text,
      variationSameCoach: variationSameCoachController.text,
      wheelProfile: wheelProfileController.text,
      intermediateWwp: intermediateWwpController.text,
      bearingSeatDiameter: bearingSeatDiameterController.text,
      rollerBearingOuterDia: rollerBearingOuterDiaController.text,
      rollerBearingBoreDia: rollerBearingBoreDiaController.text,
      rollerBearingWidth: rollerBearingWidthController.text,
      axleBoxHousingBoreDia: axleBoxHousingBoreDiaController.text,
      wheelDiscWidth: wheelDiscWidthController.text,
    );
    try {
      await WheelBogieApi.submitWheelSpecification(model);
      submitted = true;
      isEditing = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Wheel spec form submitted successfully.")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Submission failed: $e")),
      );
    }
  }

  void handleEdit() {
    isEditing = true;
    notifyListeners();
  }
}
