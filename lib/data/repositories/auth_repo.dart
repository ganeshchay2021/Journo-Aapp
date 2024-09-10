import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jurney_blog_app/data/data_sources/remote/api_endpoints_url.dart';
import 'package:jurney_blog_app/data/models/message_model.dart';
import 'package:jurney_blog_app/presentation/screens/auth/login/widget/login_model.dart';
import 'package:jurney_blog_app/utils/utils.dart';
import '../data_sources/remote/api_client.dart';

class AuthRepo extends ApiClient {
  Future<Either<LoginModel, String>> userLogin(
      {required String email, required String password}) async {
    Map body = {
      "email": email,
      "password": password,
    };

    try {
      final response =
          await postRequest(path: ApiEndpointsUrl.login, body: body);
      if (response.statusCode == 200) {
        var tagsData = LoginModel.fromJson(response.data);
        await Utils.saveToken(token: tagsData.accessToken.toString());
        return Left(tagsData);
      } else {
        return const Right("Unable to login");
      }
    } on Exception catch (e) {
      return Right(e.toString());
    }
  }

  Future<Either<MessageModel, String>> userLogout() async {
    try {
      final response = await postRequest(path: ApiEndpointsUrl.logout);
      final tagsData = MessageModel.fromJson(response.data);
      // await Utils.deleteToken();
      return Left(tagsData);
    } on Exception catch (e) {
      return Right(e.toString());
    }
  }
}
