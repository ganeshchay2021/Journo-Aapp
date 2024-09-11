part of 'widgets/home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    homeViewModel = HomeViewModel(repository: context.read<Repository>());
    homeViewModel.getAllPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocBuilder<VelocityBloc<HomeModel>, VelocityState<HomeModel>>(
        bloc: homeViewModel.postBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return Center(
              child: OverlayLoaderWithAppIcon(
                circularProgressColor: MyColors.primaryColor,
                isLoading: true,
                appIcon: const Icon(
                  FeatherIcons.loader,
                  color: MyColors.secondaryColor,
                ),
                child: const SizedBox(),
              ),
            );
          }
          if (state is VelocityUpdateState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  10.h.heightBox,
                  //banner image
                  VxSwiper.builder(
                    viewportFraction: 0.85,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    itemCount: state.data.popularPosts!.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl:
                            state.data.popularPosts![index].featuredimage!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ).cornerRadius(18).pSymmetric(h: 8.w),
                        placeholder: (context, url) => Container(
                          decoration: const BoxDecoration(color: Colors.grey),
                        ).cornerRadius(18).pSymmetric(h: 8.w),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      );
                    },
                  ),
                  20.h.heightBox,

                  Column(
                    children: [
                      //some text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Latest Post".text.size(16).make(),
                          "See All".text.size(16).make()
                        ],
                      ),
                      20.h.heightBox,

                      //list of blogs
                      ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final latestPost = state.data;
                            return HomePostTile(
                                homeModel: latestPost, index: index);
                          },
                          separatorBuilder: (context, index) => 10.h.heightBox,
                          itemCount: state.data.popularPosts!.length),
                          
                    ],
                  ).pSymmetric(h: 18.w)
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    ));
  }
}
