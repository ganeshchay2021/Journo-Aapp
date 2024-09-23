// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurney_blog_app/data/models/message_model.dart';
import 'package:jurney_blog_app/data/repositories/repository.dart';
import 'package:jurney_blog_app/presentation/screens/general/category/bloc/category_event.dart';
import 'package:jurney_blog_app/presentation/screens/general/category/widgets/category_model.dart';
import 'package:jurney_blog_app/presentation/state/common_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CommonState> {
  final Repository repository;
  CategoryBloc({required this.repository}) : super(CommonInitialState()) {
    on<FetchAllCategoryEvent>((event, emit) async {
      emit(CommonLoadingState());
      final result = await repository.categoryRepo.getAllCategory();
      result.fold(
        (data) => emit(CommonSuccessState<CategoryModel>(blogData: data)),
        (error) => emit(
          CommonErrorState(errorMsg: error),
        ),
      );
    });

    on<AddCategoryEvent>(
      (event, emit) async {
        emit(CommonLoadingState());
        final result = await repository.categoryRepo
            .addCategory(title: event.title, slug: event.slug);
        result.fold(
            (data) => emit(CommonSuccessState<MessageModel>(blogData: data)),
            (error) => emit(CommonErrorState(errorMsg: error)));
      },
      transformer: droppable(),
    );

    on<DeleteCategoryEvent>(
      (event, emit) async {
        emit(CommonLoadingState());
        final result =
            await repository.categoryRepo.deleteCategory(id: event.id);
        result.fold(
            (data) => emit(CommonSuccessState<MessageModel>(blogData: data)),
            (error) => emit(CommonErrorState(errorMsg: error)));
      },
      transformer: droppable(),
    );

    on<UpdateCategoryEvent>(
      (event, emit) async {
        emit(CommonLoadingState());
        final result = await repository.categoryRepo
            .updateCategory(id: event.id, title: event.title, slug: event.slug);
        result.fold(
            (data) => emit(CommonSuccessState<MessageModel>(blogData: data)),
            (error) => emit(CommonErrorState(errorMsg: error)));
      },
      transformer: droppable(),
    );
  }
}
