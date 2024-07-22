import 'dart:convert';
import 'dart:developer';

import '../../core/constants/constants.dart';
import '../../core/helper/cache_helper.dart';
import '../../models/authentication/login_success_models/user_data.dart';

class Repository{
  Repository._();
  static final Repository _init=Repository._();
  factory Repository.instance(){
    return _init;
  }
  static String supServiceId = '';
  static late User user;
  static getUser() async {
    String userString =
    await SharedPrefHelper.getSecuredString(AppConstants.userDataKey);
     user = User.fromJson(jsonDecode(userString));
     log(user.crmUserId,name: 'crmUserId');
    return user;
  }

}