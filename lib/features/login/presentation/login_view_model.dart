import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/di/locator.dart';
import 'package:test1/core/shared/cubits/auth_cubit/auth_cubit.dart';
import 'package:test1/features/login/data/repos/login_repo_impl.dart';
import 'package:test1/features/login/domain/repos/login_repo.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/helper/cache_helper.dart';
import '../../../../core/networking/failure.dart';
import '../data/models/login_request_model.dart';
import '../data/models/login_success_models/login_success_model.dart';
import '../data/models/login_success_models/user.dart';

class LoginViewModel {
  LoginViewModel() {
    loginRepo = locator<LoginRepoImpl>();
  }

  late final LoginRepo loginRepo;


  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  AuthCubit authCubit = AuthCubit();

  Map<String, dynamic> assignLoginRequestData() {
    LoginRequest loginRequest = LoginRequest(
        userName: phoneNumberController.text.trim(),
        password: passwordController.text.trim());
    return loginRequest.toMap();
  }


  userLogin(context) async {
    Either<Failure, LoginSuccessResponse> result =
        await loginRepo.login(assignLoginRequestData());
    result.fold((failure) {}, (loginSuccessResponse) {
      userSuccess(context, loginSuccessResponse: loginSuccessResponse);
    });
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
