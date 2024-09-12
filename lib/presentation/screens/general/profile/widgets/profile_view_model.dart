part of 'profile_imports.dart';

class ProfileViewModel {
  final Repository repository;

  ProfileViewModel({required this.repository});

  final VelocityBloc<ProfileModel> porfileBloc = VelocityBloc<ProfileModel>(ProfileModel());

  getUserProfile() async {
    var userData = await repository.profileRepo.getUserProfile();
    if (userData.status == 1) {
      porfileBloc.onUpdateData(userData);
    }
  }
}
