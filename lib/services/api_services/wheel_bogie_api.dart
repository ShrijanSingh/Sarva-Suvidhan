
import 'package:kpa_erp/models/wheel_bogie_models.dart';
import 'package:kpa_erp/services/api_services/api_service.dart';



class WheelBogieApi {
  static Future<dynamic> submitWheelSpecification(WheelSpecificationModel model) async {
    // Replace with your backend endpoint
    const endpoint = '/wheelspecification';
    return await ApiService.post(endpoint, model.toJson());
  }

  static Future<dynamic> submitBogieChecksheet(BogieChecksheetModel model) async {
    // Replace with your backend endpoint
    const endpoint = '/bogiechecksheet';
    return await ApiService.post(endpoint, model.toJson());
  }
}
