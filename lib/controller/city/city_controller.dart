import 'dart:convert';
import 'package:test1/services/app_service.dart';

import '../../models/city/city_model.dart';

class CityController {
  static List<Map<String, dynamic>> districtsAsKeyAndValue = [];
  static List<Map<String, dynamic>> cityAsKeyAndValue = [];

  static Future<dynamic> fetchActiveCities() async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName:
            '/api/city/ActiveCities?serviceId=4dc0edee-8e92-ee11-b766-000d3a236f24',
        body: null);
    if (result != null) {
      cityAsKeyAndValue = List<Map<String, dynamic>>.from(json.decode(result));
    }
    return result != null
        ? (List<KeyValueModel>.from(
            json.decode(result).map((x) => KeyValueModel.fromJson(x))))
        : <KeyValueModel>[];
  }

  static Future<dynamic> fetchDistrictsOfCity({required String cityId}) async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName:
            '/api/city/CityDistricts?serviceId=4dc0edee-8e92-ee11-b766-000d3a236f24&cityId=$cityId',
        body: null);

    if (result != null) {
      districtsAsKeyAndValue =
          List<Map<String, dynamic>>.from(json.decode(result));
    }
    return result != null
        ? (List<KeyValueModel>.from(
            json.decode(result).map((x) => KeyValueModel.fromJson(x))))
        : <KeyValueModel>[];
  }

  static Future<dynamic> fetchPolygonOfDistrict(
      {required String districtId}) async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: '/api/city/GetPolygonPath?districtId=$districtId',
        body: null);

    return result ?? '';
  }
}
