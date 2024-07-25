class KeyValueModel {
  final dynamic key;
  final String value;
  final String? image;

  KeyValueModel({required this.key, required this.value, this.image});

  factory KeyValueModel.fromJson(Map<String, dynamic> json) {
    return KeyValueModel(
      key: json['key'],
      value: json['value'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'value': value,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'ActiveCityModel {key: $key, value: $value, image: $image}';
  }
}
