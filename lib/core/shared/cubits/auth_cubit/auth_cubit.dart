import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/shared/cubits/auth_cubit/auth_states.dart';

import '../../../helper/app_regex.dart';

class AuthCubit extends Cubit<AuthStates> {

  bool isObscureText = true;
  bool isSwitched = false;

  AuthCubit() : super(AuthInitial());
  final signUpFormKey = GlobalKey<FormState>();

  toggleIsObscureText() {
    isObscureText = !isObscureText;
    emit(AuthChangeIsObscureText());
  }

  toggleIsSwitched(value) {
    isSwitched = value;
    emit(AuthChangeIsSwitched());
  }


  firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please, enter a valid name.';
    }
    return null;
  }

  middleNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please, enter a valid name.';
    }
    return null;
  }

  lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please, enter a valid name.';
    }
    return null;
  }

  phoneValidator(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
      return 'Please, enter a valid phone number.';
    }
    return null;
  }

  emailValidator(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
      return 'Please, enter a valid email.';
    }
    return null;
  }

  passwordValidator(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
      return 'Please, enter a valid phone number.';
    }
    return null;
  }

  confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
      return 'Please, enter a valid phone number.';
    }
    return null;
  }
}
