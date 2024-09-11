import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurney_blog_app/data/repositories/repository.dart';
import 'package:jurney_blog_app/presentation/screens/auth/register/widgets/register_model.dart';
import 'package:jurney_blog_app/presentation/state/common_state.dart';

class RegisterCubit extends Cubit<CommonState> {
  final Repository repository;
  RegisterCubit({required this.repository}) : super(CommonInitialState());

  userRegister(
      {required String name,
      required String email,
      required String password}) async {
    emit(CommonLoadingState());
    final result = await repository.authRepo
        .userRegister(name: name, email: email, password: password);
    result.fold(
      (data) => emit(CommonSuccessState<RegisterModel>(blogData: data)),
      (error) => emit(
        CommonErrorState(errorMsg: error),
      ),
    );
  }
}
