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

  /// GET REQUEST
  Future<Response> getRequest({required String path}) async {
    try {
      final response = await dio.get(path);
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
  Future<Response> postRequest({required String path, dynamic body}) async {
    var token = await Utils.getToken();

    final options = Options(
      headers: {"Authorization": "Bearer $token"},
    );

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
