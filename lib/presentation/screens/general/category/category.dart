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
  void initState() {
    context.read<CategoryBloc>().add(FetchAllCategoryEvent());
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
      body: BlocBuilder<CategoryBloc, CommonState>(
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
          if (state is CommonSuccessState<CategoryModel>) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final categoryData= state.blogData.categories![index];
                  //list of category
                  return CardWidget(
                    name: "${categoryData.title}",
                    index: index,
                  );
                },
                separatorBuilder: (context, index) => 10.h.heightBox,
                itemCount: state.blogData.categories!.length);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
