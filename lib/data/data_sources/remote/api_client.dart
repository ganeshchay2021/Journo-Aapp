import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jurney_blog_app/data/data_sources/remote/api_constant.dart';
import 'package:jurney_blog_app/data/data_sources/remote/api_exception.dart';
import 'package:jurney_blog_app/utils/utils.dart';

class ApiClient {
  late Dio dio;
  late BaseOptions baseOptions;
  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiConstant.mainUrl);
    dio = Dio(baseOptions);
  }

  Options options = Options();

  /// GET REQUEST
  Future<Response> getRequest({required String path, bool isTonenRequired=false}) async {
    if (isTonenRequired == true) {
      var token = await Utils.getToken();

      // Merge headers
      final headers = {
        ...baseOptions.headers,
        "Authorization": "Bearer $token",
      };

      options = options.copyWith(headers: headers);
    }
    try {
      final response = await dio.get(path, options: options);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException(message: e.response!.statusMessage);
      } else {
        throw ApiException(message: e.message);
      }
    }
  }

  /// POST REQUEST
  Future<Response> postRequest({
    required String path,
    dynamic body,
    bool isTokenRequired = false,
  }) async {
    if (isTokenRequired == true) {
      var token = await Utils.getToken();

      // Merge headers
      final headers = {
        ...baseOptions.headers,
        "Authorization": "Bearer $token",
      };

      options = options.copyWith(headers: headers);
    }

    try {
      final response = await dio.post(path, data: body, options: options);

      debugPrint("${response.data}");
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException(message: e.response!.statusMessage);
      } else {
        throw ApiException(message: e.message);
      }
    }
  }
}
