class  ResourceGroupModel {
  final String image;
  final bool hasPackage;
  final String? description;
  final String key;
  final String value;

  ResourceGroupModel({
    required this.image,
    required this.hasPackage,
    this.description,
    required this.key,
    required this.value,
  });

  // Factory method to create a DataItem from JSON
  factory ResourceGroupModel.fromJson(Map<String, dynamic> json) {
    return ResourceGroupModel(
      image: json['image'] as String,
      hasPackage: json['hasPackage'] as bool,
      description: json['description'] as String?,
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  // Convert a DataItem instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'hasPackage': hasPackage,
      'description': description,
      'key': key,
      'value': value,
    };
  }
}