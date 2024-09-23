import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurney_blog_app/data/models/message_model.dart';
import 'package:jurney_blog_app/presentation/screens/general/tags/bloc/tags_event.dart';
import 'package:jurney_blog_app/presentation/screens/general/tags/widgets/tags_model.dart';
import 'package:jurney_blog_app/presentation/state/common_state.dart';
import '../../../../../data/repositories/repository.dart';

class TagsBloc extends Bloc<TagsEvent, CommonState> {
  final Repository repository;
  TagsBloc({required this.repository}) : super(CommonInitialState()) {
    on<FetchAllTagsEvent>((event, emit) async {
      emit(CommonLoadingState());
      final result = await repository.tagsRepo.getAllTags();
      result.fold((data) => emit(CommonSuccessState<TagsModel>(blogData: data)),
          (error) => emit(CommonErrorState(errorMsg: error)));
    });

    on<AddTagsEvent>((event, emit) async {
      emit(CommonLoadingState());
      final result = await repository.tagsRepo
          .addTag(title: event.title, slug: event.slug);
      result.fold(
          (data) => emit(CommonSuccessState<MessageModel>(blogData: data)),
          (error) => emit(CommonErrorState(errorMsg: error)));
    });

    on<DeleteTagsEvent>((event, emit) async {
      emit(CommonLoadingState());
      final result = await repository.tagsRepo.deleteTag(id: event.id);
      result.fold(
          (data) => emit(CommonSuccessState<MessageModel>(blogData: data)),
          (error) => emit(CommonErrorState(errorMsg: error)));
    });

    on<UpdateTagsEvent>((event, emit) async {
      emit(CommonLoadingState());
      final result = await repository.tagsRepo
          .updateTag(id: event.id, title: event.title, slug: event.slug);
      result.fold(
          (data) => emit(CommonSuccessState<MessageModel>(blogData: data)),
          (error) => emit(CommonErrorState(errorMsg: error)));
    });
  }
}
