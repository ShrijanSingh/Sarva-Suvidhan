// checksheet_form_provider.dart
import 'package:flutter/material.dart';
import 'package:kpa_erp/models/wheel_bogie_models.dart';
import 'package:kpa_erp/services/api_services/wheel_bogie_api.dart';

class ChecksheetFormProvider extends ChangeNotifier {
  // Controllers for all dropdown fields
  final TextEditingController axleGuideAssemblyController = TextEditingController();
  final TextEditingController protectiveTubesController = TextEditingController();
  final TextEditingController anchorLinksController = TextEditingController();
  final TextEditingController sideBearerController = TextEditingController();
  final TextEditingController teeBoltHexNutController = TextEditingController();
  final TextEditingController pawlAndPawlSpringController = TextEditingController();
  final TextEditingController dustExcluderController = TextEditingController();
  // Controllers for dropdown fields
  final TextEditingController bogieFrameConditionController = TextEditingController();
  final TextEditingController bolsterController = TextEditingController();
  final TextEditingController bolsterSuspensionBracketController = TextEditingController();
  final TextEditingController lowerSpringSeatController = TextEditingController();
  final TextEditingController axleGuideController = TextEditingController();
  final TextEditingController cylinderBodyController = TextEditingController();
  final TextEditingController pistonTrunnionController = TextEditingController();
  final TextEditingController adjustingTubeController = TextEditingController();
  final TextEditingController plungerSpringController = TextEditingController();
  final TextEditingController bogieNoController = TextEditingController();
  final TextEditingController makerYearBuiltController =
      TextEditingController();
  final TextEditingController incomingDivDateController =
      TextEditingController();
  final TextEditingController deficitComponentsController =
      TextEditingController();
  final TextEditingController dateOfIohController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  bool submitted = false;
  bool isEditing = false;

  List<Map<String, Widget>> allFields = [];
  List<Map<String, Widget>> visibleFields = [];

  void initializeFields(List<Map<String, Widget>> fields) {
    allFields = fields;
    visibleFields = List.from(fields);
    notifyListeners();
  }
  // Add to class ChecksheetFormProvider

  DateTime? fromDate;
  DateTime? toDate;
  String filterBogieNo = "";
  String sortBy = "Date"; // or "Bogie No"
  bool sortAsc = true;

  bool get hasFilter =>
      filterBogieNo.isNotEmpty || fromDate != null || toDate != null;

  List<Map<String, String>> filteredData = [];

  void applyFilter() {
    // Sample dummy data to simulate actual submission storage
    final allData = [
      {
        "bogieNo": bogieNoController.text,
        "maker": makerYearBuiltController.text,
        "deficit": deficitComponentsController.text,
        "date": incomingDivDateController.text,
      },
    ];

    filteredData = allData.where((entry) {
      final entryDate = DateTime.tryParse(entry["date"] ?? "");
      final matchBogie =
          filterBogieNo.isEmpty || entry["bogieNo"]!.contains(filterBogieNo);
      final matchFrom =
          fromDate == null ||
          (entryDate != null &&
              entryDate.isAfter(fromDate!.subtract(const Duration(days: 1))));
      final matchTo =
          toDate == null ||
          (entryDate != null &&
              entryDate.isBefore(toDate!.add(const Duration(days: 1))));
      return matchBogie && matchFrom && matchTo;
    }).toList();

    // Sorting
    filteredData.sort((a, b) {
      int cmp;
      if (sortBy == "Date") {
        cmp = (DateTime.tryParse(a["date"] ?? "") ?? DateTime(2000)).compareTo(
          DateTime.tryParse(b["date"] ?? "") ?? DateTime(2000),
        );
      } else {
        cmp = a["bogieNo"]!.compareTo(b["bogieNo"]!);
      }
      return sortAsc ? cmp : -cmp;
    });

    notifyListeners();
  }

  void clearFilter() {
    filterBogieNo = "";
    fromDate = null;
    toDate = null;
    filteredData = [];
    notifyListeners();
  }

  void setSortBy(String key, bool ascending) {
    sortBy = key;
    sortAsc = ascending;
    applyFilter();
  }


  Future<void> handleSubmit(BuildContext context) async {
    final model = BogieChecksheetModel(
      formNumber: 'BOGIE-2025-001', // Example, replace with actual logic
      inspectionBy: 'user_id_456',   // Example, replace with actual user
      inspectionDate: DateTime.now().toIso8601String().split('T').first,
      bogieNo: bogieNoController.text,
      makerYearBuilt: makerYearBuiltController.text,
      incomingDivAndDate: incomingDivDateController.text,
      deficitComponents: deficitComponentsController.text,
      dateOfIoh: dateOfIohController.text,
      bogieFrameCondition: bogieFrameConditionController.text,
      bolster: bolsterController.text,
      bolsterSuspensionBracket: bolsterSuspensionBracketController.text,
      lowerSpringSeat: lowerSpringSeatController.text,
      axleGuide: axleGuideController.text,
      axleGuideAssembly: axleGuideAssemblyController.text,
      protectiveTubes: protectiveTubesController.text,
      anchorLinks: anchorLinksController.text,
      sideBearer: sideBearerController.text,
      cylinderBody: cylinderBodyController.text,
      pistonTrunnion: pistonTrunnionController.text,
      adjustingTube: adjustingTubeController.text,
      plungerSpring: plungerSpringController.text,
      teeBoltHexNut: teeBoltHexNutController.text,
      pawlAndPawlSpring: pawlAndPawlSpringController.text,
      dustExcluder: dustExcluderController.text,
    );
    try {
      await WheelBogieApi.submitBogieChecksheet(model);
      submitted = true;
      isEditing = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Bogie checksheet submitted successfully.")),
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

  void filterFields(String query) {
    if (query.isEmpty) {
      visibleFields = List.from(allFields);
    } else {
      visibleFields =
          allFields
              .where(
                (field) => field.keys.first.toLowerCase().contains(
                  query.toLowerCase(),
                ),
              )
              .toList()
            ..addAll(
              allFields.where(
                (field) => !field.keys.first.toLowerCase().contains(
                  query.toLowerCase(),
                ),
              ),
            );
    }
    notifyListeners();
  }

  Future<void> pickDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      controller.text = pickedDate.toIso8601String().split('T').first;
      notifyListeners();
    }
  }
}
