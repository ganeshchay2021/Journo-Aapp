part of 'widgets/tags_imports.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  @override
  void initState() {
    context.read<TagsBloc>().add(FetchAllTagsEvent());
    super.initState();
  }
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
      body: BlocBuilder<TagsBloc, CommonState>(
        builder: (context, state) {
          if (state is CommonLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyColors.primaryColor,
              ),
            );
          }
          if (state is CommonErrorState) {
            return Center(
              child: state.errorMsg.text.make(),
            );
          }
          if (state is CommonSuccessState) {
            return ListView.separated(
              
              itemBuilder: (context, index) {
                final tagsData=state.blogData.tags![index];
                //list of tags
                return CardWidget(
                  name: "${tagsData.title}",
                  index: index,
                );
              },
              separatorBuilder: (context, index) => 10.h.heightBox,
              itemCount: state.blogData.tags!.length,
            );
          }else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}
