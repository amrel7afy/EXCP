import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/slider/slider_response.dart';
import '../../services/api_service.dart';

class SliderController {
  late final ApiServices _apiServices;

  SliderController(){
    _apiServices=ApiServices();
  }

  Future<SliderResponse> getSlider() async {
    http.Response result=await _apiServices.get(endPoint: 'Slider');
    SliderResponse sliderResponse=SliderResponse.fromJson(jsonDecode(result.body));
    return sliderResponse;
  }
}
