class AddressData {
  final AddressLocation mainLocations;
  final List<AddressLocation> subLocation;

  AddressData({
    required this.mainLocations,
    required this.subLocation,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) {
    return AddressData(
        mainLocations: AddressLocation.fromJson(json['mainLocations']),
        subLocation: (List<AddressLocation>.from(
          json['subLocation']
              .map((item) => AddressLocation.fromJson(item))
              .toList(),
        )));
  }

  Map<String, dynamic> toJson() {
    return {
      'mainLocations': mainLocations.toJson(),
      'subLocation': subLocation.map((item) => item.toJson()).toList(),
    };
  }
}

class AddressLocation {
  final String id;
  final String displayValue;
  final int houseType;
  final String? apartmentNumber;
  final String? houseNumber;
  final String cityId;
  final int type;
  final String cityName;
  final String districtName;
  final String districtId;
  final int? floorNo;
  final bool availableForHourly;
  final bool availableForIndividual;
  final String? availabilityMessage;
  final String latitude;
  final String longitude;
  final String? addressNotes;

  AddressLocation({
    required this.id,
    required this.displayValue,
    required this.houseType,
    required this.apartmentNumber,
    required this.houseNumber,
    required this.cityId,
    required this.type,
    required this.cityName,
    required this.districtName,
    required this.districtId,
    required this.floorNo,
    required this.availableForHourly,
    required this.availableForIndividual,
    this.availabilityMessage,
    required this.latitude,
    required this.longitude,
    this.addressNotes,
  });

  factory AddressLocation.fromJson(Map<String, dynamic> json) {
    return AddressLocation(
      id: json['id'],
      displayValue: json['displayValue'],
      houseType: json['houseType'],
      apartmentNumber: json['apartmentNumber'],
      houseNumber: json['houseNumber']??'0',
      cityId: json['cityId'],
      type: json['type'],
      cityName: json['cityName'],
      districtName: json['districtName'],
      districtId: json['districtId'],
      floorNo: json['floorNo'],
      availableForHourly: json['availableForHourly'],
      availableForIndividual: json['availableForIndividual'],
      availabilityMessage: json['availabilityMessage'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      addressNotes: json['addressNotes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayValue': displayValue,
      'houseType': houseType,
      'apartmentNumber': apartmentNumber,
      'houseNumber': houseNumber,
      'cityId': cityId,
      'type': type,
      'cityName': cityName,
      'districtName': districtName,
      'districtId': districtId,
      'floorNo': floorNo,
      'availableForHourly': availableForHourly,
      'availableForIndividual': availableForIndividual,
      'availabilityMessage': availabilityMessage,
      'latitude': latitude,
      'longitude': longitude,
      'addressNotes': addressNotes,
    };
  }
}
