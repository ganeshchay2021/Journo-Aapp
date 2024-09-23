abstract class CategoryEvent {}

class FetchAllCategoryEvent extends CategoryEvent {}

class DeleteCategoryEvent extends CategoryEvent {
  final String id;

  DeleteCategoryEvent({required this.id});
}

class UpdateCategoryEvent extends CategoryEvent {
  final String id;
  final String title;
  final String slug;

  UpdateCategoryEvent({
    required this.id,
    required this.title,
    required this.slug,
  });
}

class AddCategoryEvent extends CategoryEvent {
  final String title;
  final String slug;

  AddCategoryEvent({
    required this.title,
    required this.slug,
  });
}
