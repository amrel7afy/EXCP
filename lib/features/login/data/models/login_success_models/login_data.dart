
import 'package:test1/features/login/data/models/login_success_models/user.dart';

class LoginData {
  final User user;
  final dynamic token;
  final bool twoFactorAuthEnabled;

  LoginData({
    required this.user,
    this.token,
    required this.twoFactorAuthEnabled,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: User.fromJson(json['user']),
      token: json['token'],
      twoFactorAuthEnabled: json['twoFactorAuthEnabled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'token': token,
      'twoFactorAuthEnabled': twoFactorAuthEnabled,
    };
  }
}