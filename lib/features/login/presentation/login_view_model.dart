import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/controller/authentication/authentication_controller.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/di/locator.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/login/data/repos/login_repo_impl.dart';
import 'package:test1/features/login/domain/repos/login_repo.dart';
import 'package:test1/models/authentication/login_success_models/login_data.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/helper/cache_helper.dart';
import '../../../../core/networking/failure.dart';
import '../../../cubit/generic_cubit/generic_cubit.dart';
import '../../../models/authentication/login_request_model.dart';
import '../../../models/authentication/login_success_models/login_success_model.dart';
import '../../../models/authentication/login_success_models/user_data.dart';

class LoginViewModel {
  bool isObscureText = true;
  bool isSwitched = false;

  LoginViewModel() {
    loginRepo = locator<LoginRepoImpl>();
  }

  late final LoginRepo loginRepo;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  GenericCubit<bool> textFieldCubit = GenericCubit<bool>(data: true);
  GenericCubit<String> switchCubit = GenericCubit<String>(data: '');

  Map<String, dynamic> assignLoginRequestData(phoneNumber, password) {
    LoginRequest loginRequest =
        LoginRequest(userName: phoneNumber, password: password);
    return loginRequest.toMap();
  }

  toggleIsObscureText(BuildContext context) {
    isObscureText = !isObscureText;
    textFieldCubit.update(false);
  }

  toggleIsSwitched(value, BuildContext context) {
    isSwitched = value;
    final String isSwitchedString = 'isSwitched:$value';
    switchCubit.update(isSwitchedString);
  }

  userLogin(context) async {
    LoginData loginData = await AuthenticationController.login(
      body: assignLoginRequestData(
        phoneNumberController.text.trim(),
        passwordController.text.trim(),
      ),
    );

    userSuccess(context, user: loginData.user);
  }

  validateAndLogin(BuildContext context) {
    if (loginFormKey.currentState!.validate()) {
      userLogin(context);
    }
  }

  userSuccess(BuildContext context, {required User user}) {
    cacheUserData(user);
    context.pushNamed(AppRouter.homeView);
  }

  userFailure({required String errorMessage}) {}

  void cacheUserData(User user) {
    String userAsString = jsonEncode(user);
    SharedPrefHelper.setSecuredString(AppConstants.userDataKey, userAsString);
  }
}
