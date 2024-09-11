part of 'home_imports.dart';

class HomeViewModel{
  final Repository repository;

  HomeViewModel({required this.repository});

  final VelocityBloc<HomeModel> postBloc=VelocityBloc<HomeModel>(HomeModel());

  getAllPost()async{
    var postData=await repository.homeRepo.getAllPost();

    if(postData.status==1){
      postBloc.onUpdateData(postData);
    }
  }
  
}