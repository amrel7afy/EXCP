import 'login_data.dart';

class LoginSuccessResponse {
  final LoginData data;
  final int status;
  final dynamic code;
  final dynamic message;
  final dynamic location;

  LoginSuccessResponse({
    required this.data,
    required this.status,
    this.code,
    this.message,
    this.location,
  });

  factory LoginSuccessResponse.fromJson(Map<String, dynamic> json) {
    return LoginSuccessResponse(
      data: LoginData.fromJson(json['data']) ,
      status: json['status'],
      code: json['code'],
      message: json['message'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'status': status,
      'code': code,
      'message': message,
      'location': location,
    };
  }
}