part of 'widgets/tags_imports.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      //app bar
      appBar: AppBar(
        //page title
        title: "Tags"
            .text
            .fontWeight(FontWeight.w500)
            .color(MyColors.white)
            .make(),
        actions: [
          //add tags button
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.plus,
              color: MyColors.white,
            ),
          )
        ],
      ),
      //body section
      body: ListView.separated(
        itemBuilder: (context, index) {
          //list of tags
          return CardWidget(
            name: "Tags",
            index: index,
          );
        },
        separatorBuilder: (context, index) => 10.h.heightBox,
        itemCount: 15,
      ),
    );
  }
}
