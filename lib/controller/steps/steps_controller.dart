import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:test1/cubit/loader_cubit/loader_cubit.dart';
import 'package:test1/models/steps/steps_model.dart';
import 'package:test1/services/app_service.dart';

class StepsController {

   Loading loading =Loading(false);
  StepsController(this.loading);

   Future<StepsModel?> fetchStep(BuildContext context) async {
    loading.show;
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: '/api/Steps/FirstStep?serviceType=1',
        body: null);
    loading.hide;

    if (result != null) {
      StepsModel step = StepsModel.fromJson(jsonDecode(result));
      Navigator.pushNamed(context, '/${step.name}');
      return step;
    } else {
      return null;
    }
  }
}
