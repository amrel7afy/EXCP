import 'dart:collection';
import 'dart:developer'as dev;
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test1/controller/city/city_controller.dart';
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
  GenericCubit googleMapsCubit = GenericCubit();
  List<LatLng> points = <LatLng>[];

  List<String> cityNames = [];
  List<String> districts = [];

  int currentDistrictIndex = 0;
  int currentCityIndex = 0;

  final Set<Marker> markers = HashSet<Marker>();



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
    points = prepareCoords(data);
    polygonCubit.update(points);
    loading.hide;
  }

  List<LatLng> prepareCoords(String data) {
    // Step 1: Remove square brackets and leading/trailing spaces
    String cleanData = data.replaceAll(RegExp(r"\[\s*|\s*\]"),
        ''); // Adjusted regex to remove brackets and any surrounding whitespace

    // Step 2: Split by ", " to get individual coordinate pairs
    List<String> coordinatePairs =
        cleanData.split(' ,'); // Adjusted split to handle the space after comma

    // Step 3: Convert coordinate pairs to list of LatLng objects
    List<LatLng> coordinates = [];
    for (var pair in coordinatePairs) {
      List<String> values = pair.trim().split(',');
      if (values.length == 2) {
        double? latitude = double.tryParse(values[0]);
        double? longitude = double.tryParse(values[1]);
        if (latitude != null && longitude != null) {
          coordinates.add(LatLng(latitude, longitude));
        } else {
          dev.log("Invalid coordinate pair: $pair");
        }
      } else {
        dev.log("Invalid format for pair: $pair");
      }
    }

    return coordinates;
  }



  bool isPointInPolygon(LatLng point, List<LatLng> polygon) {
    int intersections = 0;
    for (int i = 0; i < polygon.length; i++) {
      LatLng vertex1 = polygon[i];
      LatLng vertex2 = polygon[(i + 1) % polygon.length];

      if (vertex1.longitude == vertex2.longitude &&
          point.longitude == vertex1.longitude &&
          point.latitude >= min(vertex1.latitude, vertex2.latitude) &&
          point.latitude <= max(vertex1.latitude, vertex2.latitude)) {
        return true;
      }

      if (point.longitude > min(vertex1.longitude, vertex2.longitude) &&
          point.longitude <= max(vertex1.longitude, vertex2.longitude) &&
          point.latitude <= max(vertex1.latitude, vertex2.latitude) &&
          vertex1.longitude != vertex2.longitude) {
        double intersectionLat = (point.longitude - vertex1.longitude) *
            (vertex2.latitude - vertex1.latitude) /
            (vertex2.longitude - vertex1.longitude) +
            vertex1.latitude;
        if (vertex1.latitude == vertex2.latitude || point.latitude <= intersectionLat) {
          intersections++;
        }
      }
    }
    return intersections % 2 != 0;
  }
  void addMarker(LatLng tappedPoint) {
      markers.clear(); // Clear previous markers if you want only one marker at a time
      markers.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          infoWindow: InfoWindow(
            title: 'Selected Location',
            snippet: '${tappedPoint.latitude}, ${tappedPoint.longitude}',

          ),
        ),
      );
      googleMapsCubit.update();

  }


}
