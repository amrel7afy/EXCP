import 'dart:convert';
import 'package:test1/models/service_per_hour/service_class.dart';
import 'package:test1/services/app_service.dart';

class ServicePerHourController {
  fetchServicesForService() async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: 'ar/api/Service/ServicesForService?serviceType=1',
        body: null);
    return result != null
        ? (List<ServiceModel>.from(
            json.decode(result).map((x) => ServiceModel.fromJson(x))))
        : <ServiceModel>[];
  }
}
