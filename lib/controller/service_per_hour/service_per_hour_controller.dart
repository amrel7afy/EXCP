import 'dart:convert';
import 'package:test1/models/service_per_hour/service_class.dart';
import 'package:test1/services/app_service.dart';

class ServicePerHourController {
 static Future<List<ServiceModel>> fetchServicesForService() async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: '/api/Service/ServicesForService?serviceType=1',
        body: null);

    var decodedResult = jsonDecode(result);

    return result != null
        ? List<ServiceModel>.from(decodedResult
            .map((serviceModel) => ServiceModel.fromJson(serviceModel)))
        : <ServiceModel>[];
  }
}
