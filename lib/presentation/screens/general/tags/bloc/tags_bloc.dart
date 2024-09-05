import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurney_blog_app/presentation/screens/general/tags/bloc/tags_event.dart';
import 'package:jurney_blog_app/presentation/screens/general/tags/widgets/tags_model.dart';
import 'package:jurney_blog_app/presentation/state/common_state.dart';
import '../../../../../data/repositories/repository.dart';

class TagsBloc extends Bloc<TagsEvent, CommonState> {
  final Repository repository;
  TagsBloc(
    {required this.repository}
  ) : super(CommonStateInitialState()) {
    on<FetchAllTagsEvent>((event, emit)async {
      emit(CommonLoadingState());
      final result = await repository.tagsRepo.getAllTags();
      result.fold(
          (data) =>
              emit(CommonSuccessState<TagsModel>(blogData: data)),
          (error) => emit(CommonErrorState(errorMsg: error)));
    });
  }
}
