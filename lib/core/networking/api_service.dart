/*
import 'package:booking_doctor_appointment/core/constants/constants.dart';
import 'package:booking_doctor_appointment/core/helper/cache_helper.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://vcare.integration25.com/api/';
  final Dio _dio;

  ApiServices(this._dio) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = await SharedPrefHelper.getSecuredString(AppConstants.userToken);
        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }
        return handler.next(options);
      },
    ));
  }

  Future<dynamic> get({required String endPoint, Map<String, dynamic>? data}) async {
    Response response = await _dio.get('$_baseUrl$endPoint', queryParameters: data);
    return response.data;
  }

  Future<dynamic> post({required String endPoint, Map<String, dynamic>? data}) async {
    Response response = await _dio.post('$_baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<dynamic> delete({required String endPoint, Map<String, dynamic>? data}) async {
    Response response = await _dio.delete('$_baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<dynamic> put({required String endPoint, Map<String, dynamic>? data}) async {
    Response response = await _dio.put('$_baseUrl$endPoint', data: data);
    return response.data;
  }
}
*/
