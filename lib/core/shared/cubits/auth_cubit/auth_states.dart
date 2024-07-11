import 'dart:developer';

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



