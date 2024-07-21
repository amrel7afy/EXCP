class CityModel {
  final String key;
  final String value;

  CityModel({
    required this.key,
    required this.value,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      key: json['key'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'value': value,
    };
  }

  @override
  String toString() {
    return 'ActiveCityModel {key: $key, value: $value}';
  }
}
