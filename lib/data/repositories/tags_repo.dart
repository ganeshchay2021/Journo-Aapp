import 'package:fpdart/fpdart.dart';
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
}
