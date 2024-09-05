import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:jurney_blog_app/data/repositories/repository.dart';
import 'package:jurney_blog_app/presentation/screens/general/tags/widgets/tags_model.dart';

part 'tags_state.dart';

class TagsCubit extends Cubit<TagsState> {
  final Repository repository;
  TagsCubit({required this.repository}) : super(TagsInitialState());

  fechAllTags() async {
    emit(TagsLoadingState());
    final result = await repository.tagsRepo.getAllTags();
    result.fold((data) => emit(TagsSuccessState(tagsModel: data)),
        (error) => emit(TagsErrorState(errorMsg: error)));
  }
}
