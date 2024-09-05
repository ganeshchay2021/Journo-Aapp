import 'package:fpdart/fpdart.dart';
import 'package:jurney_blog_app/data/data_sources/remote/api_client.dart';
import 'package:jurney_blog_app/data/data_sources/remote/api_endpoints_url.dart';

import '../../presentation/screens/general/category/widgets/category_model.dart';

class CategoryRepo extends ApiClient{
   Future<Either<CategoryModel, String>> getAllCategory()async{
      try{
        final response = await getRequest(path: ApiEndpointsUrl.categories);
        if(response.statusCode==200){
          var catagoryData= CategoryModel.fromJson(response.data);
          return Left(catagoryData);
        }else{
          return const Right("Unable to fetch data");
        }
      }on Exception catch(e){
        return Right(e.toString());
      }
  }
}