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
      'data': data?.toJson(),
      'status': status,
      'code': code,
      'message': message,
      'location': location,
    };
  }
}

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

class User {
  final String userName;
  final bool phoneNumberConfirmed;
  final int accountType;
  final dynamic crmUserId;
  final String id;
  final String email;
  final String phoneNumber;
  final dynamic otherMobilePhone;
  final dynamic image;
  final dynamic createdBy;
  final String createdOn;
  final dynamic modifiedBy;
  final String modifiedOn;
  final bool isDeleted;
  final bool isDeactivated;
  final String name;
  final dynamic deletedOn;
  final dynamic deletedBy;
  final dynamic ownerId;
  final dynamic owner;
  final String securityStamp;
  final bool isSubscribed;

  User({
    required this.userName,
    required this.phoneNumberConfirmed,
    required this.accountType,
    this.crmUserId,
    required this.id,
    required this.email,
    required this.phoneNumber,
    this.otherMobilePhone,
    this.image,
    this.createdBy,
    required this.createdOn,
    this.modifiedBy,
    required this.modifiedOn,
    required this.isDeleted,
    required this.isDeactivated,
    required this.name,
    this.deletedOn,
    this.deletedBy,
    this.ownerId,
    this.owner,
    required this.securityStamp,
    required this.isSubscribed,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['userName'],
      phoneNumberConfirmed: json['phoneNumberConfirmed'],
      accountType: json['accountType'],
      crmUserId: json['crmUserId'],
      id: json['id'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      otherMobilePhone: json['otherMobilePhone'],
      image: json['image'],
      createdBy: json['createdBy'],
      createdOn: json['createdOn'],
      modifiedBy: json['modifiedBy'],
      modifiedOn: json['modifiedOn'],
      isDeleted: json['isDeleted'],
      isDeactivated: json['isDeactivated'],
      name: json['name'],
      deletedOn: json['deletedOn'],
      deletedBy: json['deletedBy'],
      ownerId: json['ownerId'],
      owner: json['owner'],
      securityStamp: json['securityStamp'],
      isSubscribed: json['isSubscribed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'phoneNumberConfirmed': phoneNumberConfirmed,
      'accountType': accountType,
      'crmUserId': crmUserId,
      'id': id,
      'email': email,
      'phoneNumber': phoneNumber,
      'otherMobilePhone': otherMobilePhone,
      'image': image,
      'createdBy': createdBy,
      'createdOn': createdOn,
      'modifiedBy': modifiedBy,
      'modifiedOn': modifiedOn,
      'isDeleted': isDeleted,
      'isDeactivated': isDeactivated,
      'name': name,
      'deletedOn': deletedOn,
      'deletedBy': deletedBy,
      'ownerId': ownerId,
      'owner': owner,
      'securityStamp': securityStamp,
      'isSubscribed': isSubscribed,
    };
  }
}
