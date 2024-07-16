class SliderItem {
  final String sliderItemId;
  final String name;
  final String description;
  final String image;
  final String? url;
  final int sliderType;
  final String sliderTypeName;
  final String? externalUrl;
  final int relatedOffersCount;
  final List<dynamic>? offers;

  SliderItem({
    required this.sliderItemId,
    required this.name,
    required this.description,
    required this.image,
    this.url,
    required this.sliderType,
    required this.sliderTypeName,
    this.externalUrl,
    required this.relatedOffersCount,
    this.offers,
  });

  factory SliderItem.fromJson(Map<String, dynamic> json) {
    return SliderItem(
      sliderItemId: json['sliderItemId'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      url: json['url'],
      sliderType: json['sliderType'],
      sliderTypeName: json['sliderTypeName'],
      externalUrl: json['externalUrl'],
      relatedOffersCount: json['relatedOffersCount'],
      offers: json['offers'] != null ? List<dynamic>.from(json['offers']) : null,
    );
  }
}