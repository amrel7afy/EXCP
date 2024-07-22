import 'package:test1/services/app_service.dart';

class HourlyContractController {
  static addNewAddress({required supServiceId,required body}) async {
    await AppService.callService(
      actionType: ActionType.post,
      apiName:
          '/api/HourlyContract/AddNewAddress?hourlyServiceId=$supServiceId&stepId=d282efbb-fabd-4d32-a959-02f74d4ff687',
      body: body,
    );
  }
}
