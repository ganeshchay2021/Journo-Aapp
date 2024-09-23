part of 'tags_imports.dart';

class TagsCardWidgets extends StatelessWidget {
  final int index;
  final String name;
  final String id;
  final String slug;

  const TagsCardWidgets({
    super.key,
    required this.index,
    required this.name,
    required this.id,
    required this.slug,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.white,
      child: ListTile(
        //s.n
        leading: "${index + 1}".text.size(16).make(),
        //cart title
        title: name.text.size(16).fontWeight(FontWeight.w500).make(),
        //cart trailling icons
        trailing: SizedBox(
          width: 110,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  AutoRouter.of(context).push(
                      UpdateTagsRoute(id: id, title: name, slug: slug));
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
              10.w.widthBox,
              IconButton(
                onPressed: () {
                  context.read<TagsBloc>().add(DeleteTagsEvent(id: id));
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
