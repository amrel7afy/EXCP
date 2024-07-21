import 'package:test1/services/app_service.dart';

class HourlyContractController {
  static postNewAddress() async {
    await AppService.callService(
      actionType: ActionType.post,
      apiName:
          '/api/HourlyContract/AddNewAddress?hourlyServiceId=c97fdb23-4687-ec11-a837-000d3abe20f8&'
              'stepId=6eb2df19-1cba-4c94-a53f-04faf0e4ba9d',
      body: {
        "contactId": "b9e024de-8c60-4ccc-9452-f100291bc1f1",
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
