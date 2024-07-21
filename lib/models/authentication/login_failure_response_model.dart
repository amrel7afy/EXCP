import 'package:test1/core/networking/failure.dart';

class LoginFailureResponseModel extends Failure{
  final Data? data;
  final int status;
  final dynamic code;
  final String message;
  final dynamic location;

  LoginFailureResponseModel({
    required this.data,
    required this.status,
    this.code,
   required this.message,
    this.location,
  }):super(message);

  factory LoginFailureResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginFailureResponseModel(
      data: null,
      status: json['status'],
      code: json['code'],
      message: json['message'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
      'status': status,
      'code': code,
      'message': message,
      'location': location,
    };
  }
}

class Data {
  final String phoneNumber;
  final String password;
  final dynamic code;
  final String userId;
  final bool rememberMe;

  Data({
    required this.phoneNumber,
    required this.password,
    this.code,
    required this.userId,
    required this.rememberMe,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      code: json['code'],
      userId: json['userId'],
      rememberMe: json['rememberMe'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'password': password,
      'code': code,
      'userId': userId,
      'rememberMe': rememberMe,
    };
  }
}
