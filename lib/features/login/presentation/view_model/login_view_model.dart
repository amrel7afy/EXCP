import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/di/locator.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/networking/api_service.dart';
import 'package:test1/core/shared/cubits/auth_cubit/auth_cubit.dart';
import 'package:test1/features/login/data/repos/login_repo_impl.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/helper/cache_helper.dart';
import '../../../../core/networking/failure.dart';
import '../../../../core/shared/cubits/auth_cubit/auth_states.dart';
import '../../data/models/login_request_model.dart';
import '../../data/models/login_success_models/login_success_model.dart';
import '../../data/models/login_success_models/user.dart';
import '../../domain/use_cases/login_use_case.dart';

class LoginViewModel{
  late final LoginUseCase loginUseCase;
  bool isObscureText = true;
  bool isSwitched = false;
  LoginViewModel (){
  loginUseCase=LoginUseCase(LoginRepoImpl(ApiServices(Dio())));
}


  AuthCubit authCubit=AuthCubit();




  userLogin(context) async {

    Either<Failure, LoginSuccessResponse> result = await loginUseCase.call(assignLoginRequestData());
    result.fold((failure) {

    }, (loginSuccessResponse) {

      userSuccess(context,loginSuccessResponse: loginSuccessResponse);




    });
  }
  userSuccess(context,{required LoginSuccessResponse loginSuccessResponse}){
    cacheUserData(loginSuccessResponse);
    Navigator.of(context).pushNamed(AppRouter.homeView);

  }

  userFailure({required String errorMessage}){


  }

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  Map<String, dynamic> assignLoginRequestData() {
    LoginRequest loginRequest = LoginRequest(
        userName: phoneNumberController.text.trim(),
        password: passwordController.text.trim());
    log(loginRequest.toString());
    return loginRequest.toMap();
  }




  void cacheUserData(LoginSuccessResponse successResponse) {
    User user=successResponse.data.user;
    String userAsString=jsonEncode(user);
    SharedPrefHelper.setSecuredString(AppConstants.userDataKey, userAsString);
  }
}