import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

import '../core/constants/constants.dart';
import '../core/helper/cache_helper.dart';

class ApiServices {
  final _baseUrl = 'https://crmtest.hrbs.com.sa:8006/ar/api/';

  Future<Map<String, String>> _getHeaders() async {
    String? token =
        await SharedPrefHelper.getSecuredString(AppConstants.userToken);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'source': '2'
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  Future<dynamic> post(
      {required String endPoint, Map<String, dynamic>? data}) async {
    http.Response response = await http.post(Uri.parse('$_baseUrl$endPoint'),
        body: data, headers: await _getHeaders());
    return response;
  }

  Future<dynamic> get(
      {required String endPoint, Map<String, dynamic>? data}) async {
    final uri = Uri.parse('$_baseUrl$endPoint').replace(
        queryParameters:
            data?.map((key, value) => MapEntry(key, value.toString())));

    http.Response response = await http.get(uri, headers: await _getHeaders());
    return response;
  }

  Future<dynamic> delete(
      {required String endPoint, Map<String, dynamic>? data}) async {
    http.Response response = await http.delete(
      Uri.parse('$_baseUrl$endPoint'),
      body: data != null ? jsonEncode(data) : null,
      headers: await _getHeaders(),
    );
    return response;
  }

  Future<dynamic> put(
      {required String endPoint, Map<String, dynamic>? data}) async {
    http.Response response = await http.put(
      Uri.parse('$_baseUrl$endPoint'),
      body: data != null ? jsonEncode(data) : null,
      headers: await _getHeaders(),
    );
    return response;
  }
}
