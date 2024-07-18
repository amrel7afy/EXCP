import 'package:flutter/cupertino.dart';
import 'package:test1/controller/city/city_controller.dart';
import 'package:test1/models/city/city_model.dart';

import '../../../cubit/generic_cubit/generic_cubit.dart';
import '../../../cubit/loader_cubit/loader_cubit.dart';

class NewAddressViewModel {
  Loading loading = Loading.instance();

  String? cityNameSelectedValue;
  String? areaNameSelectedValue;
  String? houseTypeSelectedValue;
  final PageController pageController = PageController(initialPage: 0);

  final List<String> areaNameOptions = ['الاندلس', 'الدمام', 'جدة'];
  final List<String> houseTypeOptions = ['عمارة', 'فيلا', 'منزل خاص'];
  GenericCubit<List<String>> cityCubit = GenericCubit<List<String>>();
  GenericCubit<List<String>> districtCubit = GenericCubit<List<String>>();

  fetchActiveCities() async {
    loading.show;
    List<CityModel> activeCities = await CityController.fetchActiveCities();
    List<String> cities = activeCities.map((city) => city.value).toList();
    cityCubit.update(cities);
    loading.hide;
  }

  fetchCityDistricts({required String cityId}) async {
    loading.show;
    List<CityModel> cityDistricts = await CityController.fetchCityDistricts(cityId: cityId);
    List<String> district = cityDistricts.map((city) => city.value).toList();
    cityCubit.update(district);
    loading.hide;
  }


}
