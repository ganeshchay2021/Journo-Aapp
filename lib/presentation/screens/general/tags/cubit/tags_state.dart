part of 'tags_cubit.dart';

@immutable
sealed class TagsState {}

final class TagsInitialState extends TagsState {}
final class TagsLoadingState extends TagsState {}
final class TagsSuccessState extends TagsState {
  final TagsModel tagsModel;
  TagsSuccessState({required this.tagsModel});
}
final class TagsErrorState extends TagsState {
  final String errorMsg;

  TagsErrorState({required this.errorMsg});
}

