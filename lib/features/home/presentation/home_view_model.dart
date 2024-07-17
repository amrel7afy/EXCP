import 'dart:developer';

import 'package:test1/controller/slider/slider_controller.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/models/slider/slider_response.dart';

import '../../../cubit/loader_cubit/loader_cubit.dart';

class HomeViewModel {
  late final SliderController sliderController;

  HomeViewModel() {
    sliderController = SliderController();
  }

  GenericCubit<SliderResponse> sliderCubit = GenericCubit<SliderResponse>();
  LoaderCubit loaderCubit = LoaderCubit(false);

  fetchSlider() async {
    loaderCubit.update(true);
    SliderResponse sliderResponse = await sliderController.getSlider();
    sliderCubit.update(sliderResponse);
    loaderCubit.update(false);
  }
}
