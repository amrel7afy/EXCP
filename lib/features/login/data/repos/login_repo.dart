import 'package:dartz/dartz.dart';
import '../../../../core/networking/failure.dart';
import '../models/login_success_response_model.dart';

abstract class LoginRepo{
Future<Either<Failure,LoginSuccessResponse>>login(Map<String,dynamic>data);
}