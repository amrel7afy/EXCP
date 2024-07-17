import 'dart:developer';

import 'package:test1/services/app_service.dart';

class StepsController{

  static fetchStep()async{
    
  var result =await AppService.callService(actionType: ActionType.get, apiName: '/api/Steps/FirstStep?serviceType=1', body: null);
    log(result);
  }
  
  
}