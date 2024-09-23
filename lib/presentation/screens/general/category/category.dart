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
            onPressed: () {
              AutoRouter.of(context).push(const AddCategoryRoute());
            },
            icon: const Icon(
              FeatherIcons.plus,
              color: MyColors.white,
            ),
          )
        ],
      ),
      //page section
      body: BlocListener<CategoryBloc, CommonState>(
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
            context.read<CategoryBloc>().add(FetchAllCategoryEvent());
          }
        },
        child: BlocBuilder<CategoryBloc, CommonState>(
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
                    final categoryData = state.blogData.categories![index];
                    //list of category
                    return CategoryCardWidget(
                      name: "${categoryData.title}",
                      index: index,
                      id: "${categoryData.id}",
                      slug: "${categoryData.slug}",
                    );
                  },
                  separatorBuilder: (context, index) => 10.h.heightBox,
                  itemCount: state.blogData.categories!.length);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
