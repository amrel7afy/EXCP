import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test1/core/networking/api_service.dart';
import 'package:test1/core/networking/failure.dart';
import 'package:test1/features/sign_up/data/model/sign_up_response.dart';
import 'package:test1/features/sign_up/data/repos/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final DioApiServices apiServices;

  SignUpRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, SignUpResponse>> signUp(Map<String,dynamic>data) async {
    try {
      var response = await apiServices.post(endPoint: 'Account/Register', data: data);
      SignUpResponse signUpResponse = SignUpResponse.fromJson(response);
      return right(signUpResponse);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure(e.response!.data['message']));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
