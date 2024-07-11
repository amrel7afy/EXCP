class SignUpResponse {
  final Data? data;
  final int status;
  final dynamic code;
  final dynamic message;
  final dynamic location;

  SignUpResponse({
    required this.data,
    required this.status,
    this.code,
    this.message,
    this.location,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      data: Data.fromJson(json['data']),
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
