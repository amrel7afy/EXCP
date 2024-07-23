import 'dart:convert';

import 'package:test1/cubit/loader_cubit/loader_cubit.dart';
import 'package:test1/models/steps/step_details_vm.dart';
import 'package:test1/services/app_service.dart';
import 'package:test1/utility/repository/repository.dart';

class StepsController {
  StepsController._internal();




  static Future<StepDetailsVm?> fetchFirstStep() async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: '/api/Steps/FirstStep?serviceType=2&Object=%7B%22ServiceId%22:%22c97fdb23-4687-ec11-a837-000d3abe20f8%22,%22SelectedPricingId%22:null,%22FromOffer%22:false%7D',
        body: null);
    StepDetailsVm step = StepDetailsVm.fromJson(jsonDecode(result));
    return result != null ? step : null;
  }
}
