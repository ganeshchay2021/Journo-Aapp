import 'package:fpdart/fpdart.dart';
import 'package:jurney_blog_app/data/models/message_model.dart';
import 'package:jurney_blog_app/presentation/screens/general/tags/widgets/tags_model.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoints_url.dart';

class TagsRepo extends ApiClient {
  Future<Either<TagsModel, String>> getAllTags() async {
    try {
      final response = await getRequest(path: ApiEndpointsUrl.tags);
      if (response.statusCode == 200) {
        var tagsData = TagsModel.fromJson(response.data);
        return Left(tagsData);
      } else {
        return const Right("Unable to Show data");
      }
    } on Exception catch (e) {
      return Right(e.toString());
    }
  }

  Future<Either<MessageModel, String>> addTag(
      {required String title, required String slug}) async {
    Map body = {"title": title, "slug": slug};
    try {
      final response = await postRequest(
          path: ApiEndpointsUrl.addTag, body: body, isTokenRequired: true);
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

  Future<Either<MessageModel, String>> deleteTag({required String id}) async {
    try {
      final response = await postRequest(
          path: "${ApiEndpointsUrl.deleteTag}/$id", isTokenRequired: true);
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

  Future<Either<MessageModel, String>> updateTag(
      {required String id, required String title, required String slug}) async {
    Map body = {"id": id, "title": title, "slug": slug};
    try {
      final response = await postRequest(
          path: ApiEndpointsUrl.updateTag, body: body, isTokenRequired: true);
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
