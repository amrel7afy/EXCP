class ServiceModel {
  final String id;
  final String name;
  final String description;
  final String iconUrl;
  final String? serviceBackImageUrl;
  final dynamic serviceNote;
  ServiceModel({required this.id, required this.name, required this.description, required this.iconUrl,
    required this.serviceBackImageUrl, this.serviceNote});



  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      iconUrl: json['iconUrl'],
      serviceBackImageUrl: json['serviceBackImageUrl'],
      serviceNote: json['serviceNote'],

    );
  }


}