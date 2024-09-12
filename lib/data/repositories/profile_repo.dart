import 'package:jurney_blog_app/data/data_sources/remote/api_client.dart';
import 'package:jurney_blog_app/data/data_sources/remote/api_endpoints_url.dart';
import 'package:jurney_blog_app/presentation/screens/general/profile/widgets/profile_model.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileRepo extends ApiClient{
   Future<ProfileModel> getUserProfile() async {
    try {
      final response = await getRequest(path: ApiEndpointsUrl.userPost, isTonenRequired: true);
      if (response.statusCode == 200) {
        var postData = ProfileModel.fromJson(response.data);
        return postData;
      } else {
        ProfileModel();
      }
    } on Exception catch (e) {
      Vx.log(e.toString());
      ProfileModel();
    }
    return ProfileModel();
  }
}