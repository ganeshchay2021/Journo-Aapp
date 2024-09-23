
sealed class TagsEvent {}

class FetchAllTagsEvent extends TagsEvent{}


class DeleteTagsEvent extends TagsEvent {
  final String id;

  DeleteTagsEvent({required this.id});
}

class UpdateTagsEvent extends TagsEvent {
  final String id;
  final String title;
  final String slug;

  UpdateTagsEvent({
    required this.id,
    required this.title,
    required this.slug,
  });
}

class AddTagsEvent extends TagsEvent {
  final String title;
  final String slug;

  AddTagsEvent({
    required this.title,
    required this.slug,
  });
}
