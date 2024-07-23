import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../../controller/account/authentication_controller.dart';
import '../../../core/helper/app_regex.dart';
import '../data/model/sign_up_request.dart';

class SignUpViewModel {
  SignUpViewModel._();

  // Static instance
  static final SignUpViewModel _instance = SignUpViewModel._();

  // Factory constructor to return the same instance
  factory SignUpViewModel.instance() {
    return _instance;
  }
  final signUpFormKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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

  Map<String, dynamic> assignSignUpRequestData() {
    SignUpRequest signUpRequest = SignUpRequest(
      userName: phoneNumberController.text.trim(),
      name: 'name',
      firstName: firstNameController.text.trim(),
      middleName: middleNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      confirmPassword: passwordController.text.trim(),

    );
    log(signUpRequest.toString());
    return signUpRequest.toMap();
  }


  signUp()async{
    await AccountController.signUp(body: assignSignUpRequestData());

  }



}
