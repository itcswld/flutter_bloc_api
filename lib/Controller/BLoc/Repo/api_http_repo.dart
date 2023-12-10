import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

import '../../../Model/ApiRespModel.dart';

class ApiHttpRepo {
  final String host = 'jsonplaceholder.typicode.com';
  final String path;
  final Map<String, dynamic>? jsonMap;

  ApiHttpRepo({required this.path, required this.jsonMap});

  Future<ApiRespModel> get() async {
    var url = Uri.http(host, path, jsonMap);
    var client = http.Client();
    try {
      http.Response response = await client.get(url);
      var result = jsonDecode(response.body);
      return ApiRespModel(
          status: response.statusCode >= 200 && response.statusCode < 300
              ? true
              : false,
          jsonMap: result);
    } catch (e) {
      return ApiRespModel(status: false, jsonMap: {'err': e.toString()});
    }
  }

  Future<ApiRespModel> post() async {
    var url = Uri.http(host, path);
    var client = http.Client();
    try {
      http.Response response = await client.post(url, body: jsonMap);
      var result = jsonDecode(response.body);
      return ApiRespModel(
          status: response.statusCode >= 200 && response.statusCode < 300
              ? true
              : false,
          jsonMap: result);
    } catch (e) {
      return ApiRespModel(status: false, jsonMap: {'err': e.toString()});
    }
  }
}
