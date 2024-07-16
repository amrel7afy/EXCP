import 'package:test1/models/slider/slider_item.dart';

class SliderResponse {
  final List<SliderItem> data;
  final int? status;
  final dynamic code;
  final dynamic message;
  final dynamic location;

  SliderResponse({
    required this.data,
    this.status,
    this.code,
    this.message,
    this.location,
  });

  factory SliderResponse.fromJson(Map<String, dynamic> json) {
    return SliderResponse(
      data:  (json['data'] as List).map((item) => SliderItem.fromJson(item)).toList()
        ,
      status: json['status'],
      code: json['code'],
      message: json['message'],
      location: json['location'],
    );
  }
}


