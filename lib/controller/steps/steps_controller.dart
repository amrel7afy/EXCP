import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:test1/cubit/loader_cubit/loader_cubit.dart';
import 'package:test1/models/steps/steps_model.dart';
import 'package:test1/services/app_service.dart';

class StepsController {
  StepsController._internal();

  static final Loading _loader = Loading.instance();

  static Future<StepsModel?> fetchFirstStep() async {
    _loader.show;
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: '/api/Steps/FirstStep?serviceType=1',
        body: null);
    _loader.hide;
    StepsModel step = StepsModel.fromJson(jsonDecode(result));
    return result != null ? step : null;
  }
}
