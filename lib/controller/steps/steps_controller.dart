import 'dart:convert';

import 'package:test1/models/steps/steps_model.dart';
import 'package:test1/services/app_service.dart';

class StepsController{

  static Future<StepsModel?>fetchStep()async{
    
  var result =await AppService.callService(actionType: ActionType.get, apiName: '/api/Steps/FirstStep?serviceType=1', body: null);

  return result!=null?StepsModel.fromJson(jsonDecode(result)):null;

  }
  
  
}