import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/slider/slider_response.dart';
import '../../services/api_service.dart';

class SliderController {
  final ApiServices apiServices;

  SliderController(this.apiServices);

  Future<SliderResponse> getSlider() async {
    http.Response result=await apiServices.get(endPoint: 'Slider');
    SliderResponse sliderResponse=SliderResponse.fromJson(jsonDecode(result.body));
    return sliderResponse;
  }
}
