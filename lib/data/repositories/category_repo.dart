import 'package:fpdart/fpdart.dart';
import 'package:jurney_blog_app/data/data_sources/remote/api_client.dart';
import 'package:jurney_blog_app/data/data_sources/remote/api_endpoints_url.dart';
import 'package:jurney_blog_app/data/models/message_model.dart';

import '../../presentation/screens/general/category/widgets/category_model.dart';

class CategoryRepo extends ApiClient {
  Future<Either<CategoryModel, String>> getAllCategory() async {
    try {
      final response = await getRequest(path: ApiEndpointsUrl.categories);
      if (response.statusCode == 200) {
        var catagoryData = CategoryModel.fromJson(response.data);
        return Left(catagoryData);
      } else {
        return const Right("Unable to fetch data");
      }
    } on Exception catch (e) {
      return Right(e.toString());
    }
  }

  Future<Either<MessageModel, String>> addCategory(
      {required String title, required String slug}) async {
    Map body = {"title": title, "slug": slug};
    try {
      final response = await postRequest(
          path: ApiEndpointsUrl.addCategory, body: body, isTokenRequired: true);
      if (response.statusCode == 200) {
        var catagoryData = MessageModel.fromJson(response.data);
        return Left(catagoryData);
      } else {
        return const Right("Unable to add data");
      }
    } on Exception catch (e) {
      return Right(e.toString());
    }
  }

  Future<Either<MessageModel, String>> deleteCategory(
      {required String id}) async {
    try {
      final response = await postRequest(
          path: "${ApiEndpointsUrl.deleteCategory}/$id", isTokenRequired: true);
      if (response.statusCode == 200) {
        var catagoryData = MessageModel.fromJson(response.data);
        return Left(catagoryData);
      } else {
        return const Right("Unable to delete data");
      }
    } on Exception catch (e) {
      return Right(e.toString());
    }
  }

  Future<Either<MessageModel, String>> updateCategory(
      {required String id, required String title, required String slug}) async {
    Map body = {"id": id, "title": title, "slug": slug};
    try {
      final response = await postRequest(
          path: ApiEndpointsUrl.updateCategory,
          body: body,
          isTokenRequired: true);
      if (response.statusCode == 200) {
        var catagoryData = MessageModel.fromJson(response.data);
        return Left(catagoryData);
      } else {
        return const Right("Unable to delete data");
      }
    } on Exception catch (e) {
      return Right(e.toString());
    }
  }
}
