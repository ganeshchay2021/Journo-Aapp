// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets_imports.dart';

class CategoryCardWidget extends StatelessWidget {
  final int index;
  final String name;
  final String id;
  final String slug;

  const CategoryCardWidget({
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
                      UpdateCategoryRoute(id: id, title: name, slug: slug));
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
              10.w.widthBox,
              IconButton(
                onPressed: () {
                  context.read<CategoryBloc>().add(DeleteCategoryEvent(id: id));
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
