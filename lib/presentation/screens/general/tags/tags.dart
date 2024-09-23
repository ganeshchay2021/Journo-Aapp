part of 'widgets/tags_imports.dart';

class Tags extends StatefulWidget {
  const Tags({
    super.key,
  });

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
        //app title
        title: "Categories"
            .text
            .fontWeight(FontWeight.w500)
            .color(MyColors.white)
            .make(),
        actions: [
          //add Tags button
          IconButton(
            onPressed: () {
              AutoRouter.of(context).push(const AddTagsRoute());
            },
            icon: const Icon(
              FeatherIcons.plus,
              color: MyColors.white,
            ),
          )
        ],
      ),
      //page section
      body: BlocListener<TagsBloc, CommonState>(
        listener: (context, state) {
          if (state is CommonLoadingState) {
            OverlayLoaderWithAppIcon(
              circularProgressColor: MyColors.primaryColor,
              isLoading: true,
              appIcon: const Icon(
                FeatherIcons.loader,
                color: MyColors.secondaryColor,
              ),
              child: const SizedBox(),
            );
          }
          if (state is CommonErrorState) {
            VxToast.show(context,
                msg: state.errorMsg,
                bgColor: Colors.red,
                textColor: Colors.white);
          }
          if (state is CommonSuccessState<MessageModel>) {
            VxToast.show(context,
                msg: "Deleted Successfully",
                bgColor: Colors.green,
                textColor: Colors.white);
            context.read<TagsBloc>().add(FetchAllTagsEvent());
          }
        },
        child: BlocBuilder<TagsBloc, CommonState>(
          builder: (context, state) {
            if (state is CommonLoadingState) {
              return OverlayLoaderWithAppIcon(
                circularProgressColor: MyColors.primaryColor,
                isLoading: true,
                appIcon: const Icon(
                  FeatherIcons.loader,
                  color: MyColors.secondaryColor,
                ),
                child: const SizedBox(),
              );
            }

            if (state is CommonErrorState) {
              return Center(
                child: state.errorMsg.text.make(),
              );
            }
            if (state is CommonSuccessState<TagsModel>) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final tagsData = state.blogData.tags![index];
                    //list of Tags
                    return TagsCardWidgets(
                      name: "${tagsData.title}",
                      index: index,
                      id: "${tagsData.id}",
                      slug: "${tagsData.slug}",
                    );
                  },
                  separatorBuilder: (context, index) => 10.h.heightBox,
                  itemCount: state.blogData.tags!.length);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
