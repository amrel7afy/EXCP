import 'dart:developer';

import 'package:test1/features/login/data/models/login_success_response_model.dart';
import 'package:test1/features/sign_up/data/model/sign_up_response.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthSuccess extends AuthStates {

}

class AuthCreateUserSuccess extends AuthStates {}

class AuthUserIsExists extends AuthStates {}

class AuthFailure extends AuthStates {
  final String error;

  AuthFailure(this.error) {
    log('AuthFailure: $error');
  }
}

class AuthUserNotExists extends AuthStates {}
class AuthSignUpSuccess extends AuthStates {
 final SignUpResponse signUpResponse;

  AuthSignUpSuccess(this.signUpResponse);
}
class AuthLoginSuccess extends AuthStates {
 final LoginSuccessResponse loginSuccessResponse;

  AuthLoginSuccess(this.loginSuccessResponse);
}



