part of 'widgets/category_imports.dart';

class Category extends StatefulWidget {
  const Category({
    super.key,
  });

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      //app bar
      appBar: AppBar(
        //app title
        title: "Categories"
            .text
            .fontWeight(FontWeight.w500)
            .color(MyColors.white)
            .make(),
        actions: [
          //add category button
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.plus,
              color: MyColors.white,
            ),
          )
        ],
      ),
      //page section
      body: ListView.separated(
          itemBuilder: (context, index) {
            //list of category
            return CardWidget(
              name: "Categories",
              index: index,
            );
          },
          separatorBuilder: (context, index) => 10.h.heightBox,
          itemCount: 15),
    );
  }
}
