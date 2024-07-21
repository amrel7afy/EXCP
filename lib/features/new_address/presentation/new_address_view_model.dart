import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test1/controller/city/city_controller.dart';
import 'package:test1/features/new_address/presentation/address_on_map_screen.dart';
import 'package:test1/models/city/city_model.dart';

import '../../../cubit/generic_cubit/generic_cubit.dart';
import '../../../cubit/loader_cubit/loader_cubit.dart';

class NewAddressViewModel {
  Loading loading = Loading.instance();

  String? cityNameSelectedValue;
  String? districtSelectedValue;
  String? houseTypeSelectedValue;
  String? floorSelectedValue;

  final List<String> houseTypeOptions = ['عمارة', 'فيلا', 'منزل خاص'];
  final List<String> floorOptions =
      List.generate(30, (index) => (index + 1).toString());

  GenericCubit<List<CityModel>> cityCubit = GenericCubit<List<CityModel>>();
  GenericCubit<List<CityModel>> districtCubit = GenericCubit<List<CityModel>>();
  GenericCubit<List<LatLng>> polygonCubit = GenericCubit<List<LatLng>>();
  List<LatLng> points = <LatLng>[];

  List<String> cityNames = [];
  List<String>? districts = [];

  int currentDistrictIndex = 0;



  getDistrictIndex(newVal){
    int index=districts!.indexOf(newVal);
    currentDistrictIndex=index;
  }

  String? getCityKey(String cityName, List<CityModel> cities) {
    return cities.firstWhere((city) => city.value == cityName).key;
  }

  List<String> getCityNames(List<CityModel> cities) {
    return cities.map((city) => city.value).toList();
  }

  fetchActiveCities() async {
    loading.show;
    List<CityModel> activeCities = await CityController.fetchActiveCities();
    cityNames = activeCities.map((city) => city.value).toList();
    cityCubit.update(activeCities);
    loading.hide;
  }

  fetchDistrictsOfCity({required String cityId}) async {
    loading.show;
    List<CityModel> cityDistricts =
        await CityController.fetchDistrictsOfCity(cityId: cityId);
    districts = cityDistricts.map((city) => city.value).toList();
    districtCubit.update(cityDistricts);
    loading.hide;
  }

  fetchPolygon(BuildContext context) async {
    loading.show;
    String data = await CityController.fetchPolygonOfDistrict(
        districtId: CityController.districtsAsKeyAndValue[currentDistrictIndex]['key']);
    points = prepareCoords(data);
    polygonCubit.update(points);
    loading.hide;

  }
}
