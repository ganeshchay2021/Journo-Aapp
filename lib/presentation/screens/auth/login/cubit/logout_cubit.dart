import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurney_blog_app/data/models/message_model.dart';
import 'package:jurney_blog_app/data/repositories/repository.dart';
import 'package:jurney_blog_app/presentation/state/common_state.dart';

class LogoutCubit extends Cubit<CommonState> {
  final Repository repository;
  LogoutCubit({required this.repository}) : super(CommonInitialState());

  userLogout() async {
    emit(CommonLoadingState());
    final result = await repository.authRepo.userLogout();
    result.fold(
      (data) => emit(CommonSuccessState<MessageModel>(blogData: data)),
      (error) => emit(
        CommonErrorState(errorMsg: error),
      ),
    );
  }
}
