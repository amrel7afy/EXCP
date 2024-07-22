class UserEntity{
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
  final bool? isSubscribed;

  UserEntity(
      {required this.userName,
      required this.phoneNumberConfirmed,
      required this.accountType,
      required this.crmUserId,
      required this.id,
      required this.email,
      required this.phoneNumber,
      required this.otherMobilePhone,
      required this.image,
      required this.createdBy,
      required this.createdOn,
      required this.modifiedBy,
      required this.modifiedOn,
      required this.isDeleted,
      required this.isDeactivated,
      required this.name,
      required this.deletedOn,
      required this.deletedBy,
      required this.ownerId,
      required this.owner,
      required this.securityStamp,
      required this.isSubscribed});
}