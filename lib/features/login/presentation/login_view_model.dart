import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/di/locator.dart';
import 'package:test1/features/login/data/repos/login_repo_impl.dart';
import 'package:test1/features/login/domain/repos/login_repo.dart';
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

  GenericCubit<bool> textFieldCubit = GenericCubit<bool>(true);
  GenericCubit<String> switchCubit = GenericCubit<String>('');

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
    Either<Failure, LoginSuccessResponse> result = await loginRepo.login(
        assignLoginRequestData(
            phoneNumberController.text.trim(), passwordController.text.trim()));
    result.fold((failure) {}, (loginSuccessResponse) {
      userSuccess(context, loginSuccessResponse: loginSuccessResponse);
    });
  }

  validateAndLogin(BuildContext context) {
    if (loginFormKey.currentState!.validate()) {
      userLogin(context);
    }
  }

  userSuccess(context, {required LoginSuccessResponse loginSuccessResponse}) {
    cacheUserData(loginSuccessResponse);
    Navigator.of(context).pushNamed(AppRouter.homeView);
  }

  userFailure({required String errorMessage}) {}

  void cacheUserData(LoginSuccessResponse successResponse) {
    User user = successResponse.data.user;
    String userAsString = jsonEncode(user);
    SharedPrefHelper.setSecuredString(AppConstants.userDataKey, userAsString);
  }
}
