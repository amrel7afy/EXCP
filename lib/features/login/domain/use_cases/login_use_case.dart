import 'package:dartz/dartz.dart';
import 'package:test1/core/constants/use_cases/use_case.dart';
import 'package:test1/core/networking/failure.dart';
import 'package:test1/features/login/data/models/login_success_response_model.dart';
import 'package:test1/features/login/domain/repos/login_repo.dart';

class LoginUseCase
    implements UseCase<LoginSuccessResponse, Map<String, dynamic>> {
  LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  @override
  Future<Either<Failure, LoginSuccessResponse>> call(
      Map<String, dynamic> param) async {
    return await loginRepo.login(param);
  }
}
