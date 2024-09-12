// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jurney_blog_app/data/repositories/repository.dart';
import 'package:jurney_blog_app/presentation/screens/auth/login/widget/login_model.dart';
import 'package:jurney_blog_app/presentation/state/common_state.dart';

class LoginCubit extends Cubit<CommonState> {
  final Repository repository;
  LoginCubit({required this.repository}) : super(CommonInitialState());

  userLogin({required String email, required String password, required bool rememberMe}) async {
    emit(CommonLoadingState());
    final result =
        await repository.authRepo.userLogin(email: email, password: password, rememberMe: rememberMe);
    result.fold(
      (data) => emit(CommonSuccessState<LoginModel>(blogData: data)),
      (error) => emit(
        CommonErrorState(errorMsg: error),
      ),
    );
  }
}
