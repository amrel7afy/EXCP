import 'package:test1/models/authentication/login_success_models/user_data.dart';
import 'package:test1/services/app_service.dart';
import 'package:test1/utility/repository/repository.dart';

class SavedContactLocationController {


  static getSavedContacts() async {
    User user=await Repository.getUser();
    await AppService.callService(actionType: ActionType.get,
        apiName: '/api/SavedContactLocation/ContactSavedAddress?'
            'contactId=${user.crmUserId}&serviceId=${Repository.supServiceId}',
        body: null);
  }
}