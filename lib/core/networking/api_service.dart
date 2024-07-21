import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants/constants.dart';
import '../helper/cache_helper.dart';

class DioApiServices {
  final _baseUrl = 'https://crmtest.hrbs.com.sa:8006/ar/api/';
 // final _baseUrl= 'https://mueen-apitest.azurewebsites.net/ar/api/';

  final Dio _dio;

  DioApiServices(this._dio) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token =
              await SharedPrefHelper.getSecuredString(AppConstants.userToken);
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }
          options.headers.addAll({'lang': 'en', 'source': 2});
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          // Handle specific status codes or error messages here
          log('Dio error: ${e.message}');
          if (e.response != null) {
            log('Response data: ${e.response?.data}');
          }
          return handler.next(e);
        },
      ),
    );
  }
  Future<dynamic> post(
      {required String endPoint, Map<String, dynamic>? data}) async {
    Response response = await _dio.post('$_baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<dynamic> get(
      {required String endPoint, Map<String, dynamic>? data}) async {
    Response response =
        await _dio.get('$_baseUrl$endPoint', queryParameters: data);
    return response.data;
  }



  Future<dynamic> delete(
      {required String endPoint, Map<String, dynamic>? data}) async {
    Response response = await _dio.delete('$_baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<dynamic> put(
      {required String endPoint, Map<String, dynamic>? data}) async {
    Response response = await _dio.put('$_baseUrl$endPoint', data: data);
    return response.data;
  }
}
