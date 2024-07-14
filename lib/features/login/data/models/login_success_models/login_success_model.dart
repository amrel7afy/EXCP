import 'package:test1/features/login/domain/entity/user_entity.dart';

import 'login_data.dart';

class LoginSuccessResponse extends UserEntity {
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
  }) : super(
          userName: data.user.userName,
          phoneNumberConfirmed: data.user.phoneNumberConfirmed,
          accountType: data.user.accountType,
          crmUserId: data.user.crmUserId,
          id: data.user.id,
          email: data.user.email,
          phoneNumber: data.user.phoneNumber,
          otherMobilePhone: data.user.otherMobilePhone,
          image: data.user.image,
          createdBy: data.user.createdBy,
          createdOn: data.user.createdOn,
          modifiedBy: data.user.modifiedBy,
          modifiedOn: data.user.modifiedOn,
          isDeleted: data.user.isDeleted,
          isDeactivated: data.user.isDeactivated,
          name: data.user.name,
          deletedOn: data.user.deletedOn,
          deletedBy: data.user.deletedBy,
          ownerId: data.user.ownerId,
          owner: data.user.owner,
          securityStamp: data.user.securityStamp,
          isSubscribed: data.user.isSubscribed,
        );

  factory LoginSuccessResponse.fromJson(Map<String, dynamic> json) {
    return LoginSuccessResponse(
      data: LoginData.fromJson(json['data']),
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
