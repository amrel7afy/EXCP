import 'package:test1/controller/slider/slider_controller.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';

import '../../../cubit/loader_cubit/loader_cubit.dart';
import '../../../models/slider/slider_item.dart';

class HomeViewModel {
  late final SliderController sliderController;

  HomeViewModel() {
    sliderController = SliderController();
  }

  GenericCubit<List<SliderItem>> sliderCubit = GenericCubit<List<SliderItem>>();
  Loading loading = Loading(false);

  fetchSlider() async {
    loading.show;

    List<SliderItem> sliderItems = await sliderController.getSlider();
    sliderCubit.update(sliderItems);
    loading.hide;
  }
}
