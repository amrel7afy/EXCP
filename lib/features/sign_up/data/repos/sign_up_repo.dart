import 'package:dartz/dartz.dart';
import 'package:test1/features/sign_up/data/model/sign_up_request.dart';
import 'package:test1/features/sign_up/data/model/sign_up_response.dart';

import '../../../../core/networking/failure.dart';

abstract class SignUpRepo{
Future<Either<Failure,SignUpResponse>>signUp(Map<String,dynamic>data);
}