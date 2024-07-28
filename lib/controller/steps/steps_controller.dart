import 'dart:convert';

import 'package:test1/models/steps/step_details_vm.dart';
import 'package:test1/services/app_service.dart';

class StepsController {
  StepsController._internal();

  static Future<StepDetailsVm?> fetchFirstStep(object) async {

    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: '/api/Steps/FirstStep?serviceType=2&Object=$object',
        body: null);
    StepDetailsVm step = StepDetailsVm.fromJson(jsonDecode(result));
    return result != null ? step : null;
  }
}
