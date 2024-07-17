import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/cubit/loader_cubit/loader_cubit.dart';
import 'package:test1/models/steps/steps_model.dart';
import 'package:test1/services/app_service.dart';

class StepsController {
  static Loading loading = Loading(false);

  static Future<StepsModel?> fetchStep(BuildContext context) async {
    loading.show;
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: '/api/Steps/FirstStep?serviceType=1',
        body: null);
    StepsModel step = StepsModel.fromJson(jsonDecode(result));
    loading.hide;
    context.pushNamed('/${step.name}');
    return result != null ? StepsModel.fromJson(jsonDecode(result)) : null;
  }
}
