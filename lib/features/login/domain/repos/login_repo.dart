import 'package:dartz/dartz.dart';
import '../../../../core/networking/failure.dart';
import '../../data/models/login_success_models/login_success_model.dart';

abstract class LoginRepo{
Future<Either<Failure,LoginSuccessResponse>>login(Map<String,dynamic>data);
}