import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test1/core/networking/api_service.dart';
import 'package:test1/core/networking/failure.dart';

import '../../../../models/authentication/login_failure_response_model.dart';
import '../../../../models/authentication/login_success_models/login_success_model.dart';
import '../../domain/repos/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiServices apiServices;

  LoginRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, LoginSuccessResponse>> login(Map<String,dynamic>data) async {
    try {
      var response = await apiServices.post(endPoint: 'Account/Login', data: data);
      LoginSuccessResponse loginSuccessResponse = LoginSuccessResponse.fromJson(response);
      return right(loginSuccessResponse);
    } catch (e) {
      if(e is DioException){
        return left(LoginFailureResponseModel.fromJson(e.response!.data));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
