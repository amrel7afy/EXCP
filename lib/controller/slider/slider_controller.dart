import 'dart:convert';

import 'package:test1/models/slider/slider_item.dart';
import 'package:test1/services/app_service.dart';

class SliderController {
  Future<List<SliderItem>> getSlider() async {
    var result = await AppService.callService(
        actionType: ActionType.get, apiName: '/api/Slider', body: null);

    return result != null
        ? (List<SliderItem>.from(json.decode(result).map((x) => SliderItem.fromJson(x))))
        : <SliderItem>[];
  }
}