class AddressData {
  final Location mainLocations;
  final List<Location> subLocation;

  AddressData({
    required this.mainLocations,
    required this.subLocation,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) {
    return AddressData(
      mainLocations: Location.fromJson(json['mainLocations']),
      subLocation: (json['subLocation'] as List)
          .map((item) => Location.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mainLocations': mainLocations.toJson(),
      'subLocation': subLocation.map((item) => item.toJson()).toList(),
    };
  }
}

class Location {
  final String id;
  final String displayValue;
  final int houseType;
  final String apartmentNumber;
  final String houseNumber;
  final String cityId;
  final int type;
  final String cityName;
  final String districtName;
  final String districtId;
  final int floorNo;
  final bool availableForHourly;
  final bool availableForIndividual;
  final String? availabilityMessage;
  final String latitude;
  final String longitude;
  final String? addressNotes;

  Location({
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

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      displayValue: json['displayValue'],
      houseType: json['houseType'],
      apartmentNumber: json['apartmentNumber'],
      houseNumber: json['houseNumber'],
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
