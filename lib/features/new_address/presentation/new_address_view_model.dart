import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test1/components/step_view_model.dart';
import 'package:test1/controller/city/city_controller.dart';
import 'package:test1/controller/hourly_contract/hourly_contract_controller.dart';
import 'package:test1/models/city/city_model.dart';

import '../../../cubit/generic_cubit/generic_cubit.dart';
import '../../../cubit/loader_cubit/loader_cubit.dart';
import '../data/model.dart';
import 'google_maps_view_model.dart';

class NewAddressViewModel {
  NewAddressViewModel._();

  // Static instance
  static final NewAddressViewModel _instance = NewAddressViewModel._();

  // Factory constructor to return the same instance
  factory NewAddressViewModel.instance() {
    return _instance;
  }
  Loading loading = Loading.instance();

   String? cityNameSelectedValue;
   String? districtSelectedValue;
   String? houseTypeSelectedValue;
   String? floorSelectedValue;
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController addressNotesController = TextEditingController();

  final List<String> houseTypeOptions = ['عمارة', 'فيلا', 'منزل خاص'];
  final List<String> floorOptions =
  List.generate(30, (index) => (index + 1).toString());

  GenericCubit<List<CityModel>> cityCubit = GenericCubit<List<CityModel>>();
  GenericCubit<List<CityModel>> districtCubit = GenericCubit<List<CityModel>>();
  GenericCubit<List<LatLng>> polygonCubit = GenericCubit<List<LatLng>>();
  List<LatLng> points = <LatLng>[];

  List<String> cityNames = [];
  List<String> districts = [];

  int currentDistrictIndex = 0;
  int currentCityIndex = 0;

  StepsViewModel stepsViewModel = StepsViewModel.instance();
  LatLng? targetPosition;
  GlobalKey<FormState>formKey=GlobalKey<FormState>();

//---------------------------------------------------------------------------

  getDistrictIndex(newVal) {
    int index = districts.indexOf(newVal);
    currentDistrictIndex = index;
  }

  getCityIndex(newVal) {
    int index = cityNames.indexOf(newVal);
    currentCityIndex = index;
  }

  fetchActiveCities() async {
    loading.show;
    List<CityModel> activeCities = await CityController.fetchActiveCities();
    cityNames = activeCities.map((city) => city.value).toList();
    cityCubit.update(activeCities);
    loading.hide;
  }

  fetchDistrictsOfCity() async {
    loading.show;
    List<CityModel> cityDistricts = await CityController.fetchDistrictsOfCity(
        cityId: CityController.cityAsKeyAndValue[currentCityIndex]['key']);
    districts = cityDistricts.map((city) => city.value).toList();
    districtCubit.update(cityDistricts);
    loading.hide;
  }

  fetchPolygon(BuildContext context) async {
    loading.show;
    String data = await CityController.fetchPolygonOfDistrict(
        districtId: CityController.districtsAsKeyAndValue[currentDistrictIndex]
        ['key']);
    points = GoogleMapsViewModel.prepareCoords(data);
    polygonCubit.update(points);
    loading.hide;
  }


  assignAddressData() {
    NewAddressRequestBody newAddressRequest = NewAddressRequestBody(
        addressNotes: addressNotesController.text.trim(),
        houseNo: houseNumberController.text.trim(),
        houseType: getHouseType(houseTypeSelectedValue!),
        floorNo: floorSelectedValue??'0',
        apartmentNo: '1',
        cityId: CityController.cityAsKeyAndValue[currentCityIndex]['key'],
        districtId: CityController.districtsAsKeyAndValue[currentDistrictIndex]['key'],
        latitude: targetPosition!.latitude,
        longitude: targetPosition!.longitude,
        type: 1);
    return newAddressRequest.toMap();
  }

  int getHouseType(String houseTypeSelectedValue) {
    switch (houseTypeSelectedValue.toLowerCase()) {
      case 'عمارة':
        return 0;
      case 'منزل خاص':
        return 1;
      case 'فيلا':
        return 2;
      default:
        return -1; // Invalid house type
    }
  }

  addNewAddress() async {
    loading.show;
    await HourlyContractController.addNewAddress(
        supServiceId: StepsViewModel.supServiceId, body:assignAddressData());
    loading.hide;
  }
}
