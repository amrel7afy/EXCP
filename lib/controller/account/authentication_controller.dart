import 'dart:convert';

import 'package:test1/models/authentication/login_success_models/login_data.dart';
import 'package:test1/services/app_service.dart';

import '../../features/sign_up/data/model/sign_up_response.dart';

class AccountController {
  static login({required body}) async {
    var result = await AppService.callService(
        actionType: ActionType.post, apiName: 'api/Account/Login', body: body);
    LoginData loginData = LoginData.fromJson(jsonDecode(result),);
    return result != null ?loginData:null;
  }
  static signUp({required body}) async {
    var result = await AppService.callService(
        actionType: ActionType.post, apiName: 'api/Account/Register', body: body);
    SignUpData signupData = SignUpData.fromJson(jsonDecode(result),);
    return result != null ?signupData:null;
  }
}
