
import 'package:dartz/dartz.dart';

import '../../networking/failure.dart';


abstract class UseCase<Type,Param>{
  Future<Either<Failure,Type>>call(Param param);

}

