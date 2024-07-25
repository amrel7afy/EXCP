
class SignUpData {
  final String phoneNumber;
  final String password;
  final dynamic code;
  final String userId;
  final bool rememberMe;

  SignUpData({
    required this.phoneNumber,
    required this.password,
    this.code,
    required this.userId,
    required this.rememberMe,
  });

  factory SignUpData.fromJson(Map<String, dynamic> json) {
    return SignUpData(
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
