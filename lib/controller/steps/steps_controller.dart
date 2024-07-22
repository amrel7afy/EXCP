import 'dart:convert';

import 'package:test1/cubit/loader_cubit/loader_cubit.dart';
import 'package:test1/models/steps/step_details_vm.dart';
import 'package:test1/services/app_service.dart';

class StepsController {
  StepsController._internal();

  static final Loading _loader = Loading.instance();


  static Future<StepDetailsVm?> fetchFirstStep(supServiceId) async {
    _loader.show;
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: '/api/Steps/FirstStep?serviceType=1&serviceId=$supServiceId',
        body: null);
    _loader.hide;
    StepDetailsVm step = StepDetailsVm.fromJson(jsonDecode(result));
    return result != null ? step : null;
  }
}
