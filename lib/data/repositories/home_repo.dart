import 'package:jurney_blog_app/data/data_sources/remote/api_client.dart';
import 'package:jurney_blog_app/data/data_sources/remote/api_endpoints_url.dart';
import 'package:jurney_blog_app/presentation/screens/general/home/widgets/home_model.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeRepo extends ApiClient {
  Future<HomeModel> getAllPost() async {
    try {
      final response = await getRequest(path: ApiEndpointsUrl.posts);
      if (response.statusCode == 200) {
        var postData = HomeModel.fromJson(response.data);
        return postData;
      } else {
        HomeModel();
      }
    } on Exception catch (e) {
      Vx.log(e.toString());
      HomeModel();
    }
    return HomeModel();
  }
}
