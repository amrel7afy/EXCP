class NewAddressRequestBody {
  final String contactId;
  final String addressNotes;
  final String houseNo;
  final int houseType;
  final String? floorNo;
  final String? apartmentNo;
  final String cityId;
  final String districtId;
  final double latitude;
  final double longitude;
  final int type;

  NewAddressRequestBody({
    this.contactId='bcc8e562-736b-484a-8455-e1f1911a0911',
    required this.addressNotes,
    required this.houseNo,
    required this.houseType,
    required this.floorNo,
    required this.apartmentNo,
    required this.cityId,
    required this.districtId,
    required this.latitude,
    required this.longitude,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'contactId': contactId,
      'addressNotes': addressNotes,
      'houseNo': houseNo,
      'houseType': houseType,
      'floorNo': floorNo??'0',
      'apartmentNo': apartmentNo??'0',
      'cityId': cityId,
      'districtId': districtId,
      'latitude': latitude,
      'longitude': longitude,
      'type': type,
    };
  }
}
