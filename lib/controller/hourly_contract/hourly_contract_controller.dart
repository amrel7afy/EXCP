import 'dart:convert';

import 'package:test1/services/app_service.dart';
import 'package:test1/utility/repository/repository.dart';

import '../../models/steps/step_model.dart';

class HourlyContractController {
  static addNewAddress({required body}) async {
    await AppService.callService(
      actionType: ActionType.post,
      apiName:
          '/api/HourlyContract/AddNewAddress?hourlyServiceId=${Repository.supServiceId}&stepId=d282efbb-fabd-4d32-a959-02f74d4ff687',
      body: body,
    );
  }

  static selectAddress({
    required String selectedLocationId,
  }) async {
   var result= await AppService.callService(
        actionType: ActionType.post,
        apiName:
            'api/HourlyContract/SavedAddresses?selectedLocationId=$selectedLocationId&hourlyServiceId=${Repository.supServiceId}'
                '&stepId=${Repository.stepIdFromFirstStep}',
        body: null);

   return result!=null?StepModel.fromJson(jsonDecode(result)):null;
  }

  static fetchFixedPackages() async {
    await AppService.callService(
      actionType: ActionType.get,
      apiName:
          '/api/HourlyContract/FixedPackage?stepId=0e7624f4-15e6-4db1-866e-504bdf33ef3d',
      body: null,
    );
  }
}
