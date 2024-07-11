import 'dart:developer';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout, Please try again.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout, Please try again.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout, Please try again.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response?.statusCode, dioException.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to server was cancelled.');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error, Please check your internet connection.');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate, Please check your security settings.');
      case DioExceptionType.unknown:
      default:
        return ServerFailure('Oops, There was an error, please try later.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403||statusCode==405) {
      return ServerFailure(response['message']);
    } else if (statusCode! >= 404 && statusCode<500) {
      log('Status code: $statusCode,');
       return ServerFailure(response);
    } else if (statusCode >= 500) {
      log('Status code: $statusCode,');
      return ServerFailure('Internal server error, Try again later!');
    } else {
      log('Status code: $statusCode,');
      return ServerFailure('Oops, Something went wrong.');
    }
  }
}
