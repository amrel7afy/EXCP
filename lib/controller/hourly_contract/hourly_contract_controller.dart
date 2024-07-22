import 'package:test1/services/app_service.dart';

class HourlyContractController {
  static addNewAddress({required supServiceId,required body}) async {
    await AppService.callService(
      actionType: ActionType.post,
      apiName:
          '/api/HourlyContract/AddNewAddress?hourlyServiceId=$supServiceId&stepId=d282efbb-fabd-4d32-a959-02f74d4ff687',
      body: {
        "contactId": "bcc8e562-736b-484a-8455-e1f1911a0911",
        "addressNotes": "",
        "houseNo": "3",
        "houseType": "0",
        "floorNo": "0",
        "apartmentNo": "0",
        "cityId": "629a2a15-14fa-e911-a81f-000d3abaded5",
        "districtId": "399fd352-5197-ee11-b766-000d3a236f24",
        "latitude": "24.767891",
        "longitude": "46.758968",
        "type": 2
      },
    );
  }
}
