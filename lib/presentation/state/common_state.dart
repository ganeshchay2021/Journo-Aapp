sealed class CommonState {}

final class CommonInitialState extends CommonState {}

final class CommonLoadingState extends CommonState {}

final class CommonSuccessState<Type> extends CommonState {
  final Type blogData;

  CommonSuccessState({required this.blogData});
}

final class CommonErrorState extends CommonState {
  final String errorMsg;

  CommonErrorState({required this.errorMsg});
}
