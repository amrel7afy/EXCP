import 'dart:convert';
import 'package:test1/services/app_service.dart';

import '../../models/city/city_model.dart';

class CityController {

  static Future<dynamic> fetchActiveCities() async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName:
            '/api/city/ActiveCities?serviceId=4dc0edee-8e92-ee11-b766-000d3a236f24',
        body: null);

    return result != null
        ? (List<CityModel>.from(
            json.decode(result).map((x) => CityModel.fromJson(x))))
        : <CityModel>[];
  }

  static Future<dynamic> fetchCityDistricts({required String cityId}) async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName:
            '/api/city/CityDistricts?serviceId=4dc0edee-8e92-ee11-b766-000d3a236f24&cityId=$cityId',
        body: null);

    return result != null
        ? (List<CityModel>.from(
            json.decode(result).map((x) => CityModel.fromJson(x))))
        : <CityModel>[];
  }
}
