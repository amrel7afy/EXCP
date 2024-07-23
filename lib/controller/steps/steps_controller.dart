import 'dart:convert';

import 'package:test1/cubit/loader_cubit/loader_cubit.dart';
import 'package:test1/models/fist_step/first_step_obj_parameter.dart';
import 'package:test1/models/steps/step_details_vm.dart';
import 'package:test1/services/app_service.dart';
import 'package:test1/utility/repository/repository.dart';

class StepsController {
  StepsController._internal();




  static Future<StepDetailsVm?> fetchFirstStep() async {
    final String object=jsonEncode(FirstStepObjParameter(
        fromOffer: false,
        selectedPricingId: null,
        serviceId: Repository.supServiceId
    ).toJson());
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: '/api/Steps/FirstStep?serviceType=2&Object=$object',
        body: null);
    StepDetailsVm step = StepDetailsVm.fromJson(jsonDecode(result));
    return result != null ? step : null;
  }
}
