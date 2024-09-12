part of 'widgets/profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = false;

  late ProfileViewModel profileViewModel;
  @override
  void initState() {
    profileViewModel = ProfileViewModel(repository: context.read<Repository>());
    profileViewModel.getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlayLoaderWithAppIcon(
      circularProgressColor: MyColors.primaryColor,
      isLoading: isLoading,
      appIcon: const Icon(
        FeatherIcons.loader,
        color: MyColors.secondaryColor,
      ),
      child: Scaffold(
        //app bar
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                // var data = await Utils.getToken();
                // Vx.log(data);
                context.read<LogoutCubit>().userLogout();
              },
              icon: const Icon(
                FeatherIcons.logOut,
                color: MyColors.white,
              ).pOnly(
                right: 10,
              ),
            ),
          ],
        ),
        //page section
        body: BlocConsumer<VelocityBloc<ProfileModel>,
            VelocityState<ProfileModel>>(
          bloc: profileViewModel.porfileBloc,
          listener: (context, state) {
            if (state is VelocityFailedState) {
              VxToast.show(context,
                  msg: state.error,
                  bgColor: Colors.red,
                  textColor: Colors.white);
            }
          },
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
            return SingleChildScrollView(
              child: BlocListener<LogoutCubit, CommonState>(
                listener: (context, state) {
                  if (state is CommonLoadingState) {
                    setState(() {
                      isLoading = true;
                    });
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                  }
                  if (state is CommonErrorState) {
                    VxToast.show(context,
                        msg: state.errorMsg,
                        bgColor: Colors.red,
                        textColor: Colors.white);
                  }
                  if (state is CommonSuccessState<MessageModel>) {
                    AutoRouter.of(context).replace(const AuthRoute());
                    VxToast.show(context,
                        msg: state.blogData.message.toString(),
                        bgColor: Colors.red,
                        textColor: Colors.white);
                  }
                },
                child: Column(
                  children: [
                    //My profile Heading
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.50,
                      decoration: const BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          //profile image
                          CachedNetworkImage(
                            imageUrl: state.data.userDetails!.profilePhotoUrl
                                .toString(),
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                                    radius: 70, backgroundImage: imageProvider),
                            placeholder: (context, url) => const CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.grey,
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),

                          10.h.heightBox,
                          //user's name
                          state.data.userDetails!.name!.text.bold.xl2.white
                              .make(),
                          //user gmail
                          state.data.userDetails!.email!.text.white.make(),
                          20.h.heightBox,
                          //About user
                          "${state.data.userDetails!.name} AKA (${state.data.userDetails!.name!.substring(0, 6)}) is a software engineer who is more passinate about technology. His ambition towards technology is huge"
                              .text
                              .white
                              .center
                              .make()
                              .pSymmetric(h: 20.w),
                          30.h.heightBox,
                          //user's no. of post, following and followers
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //No.of Post
                                Column(
                                  children: [
                                    state.data.postsCount!.text.bold.xl3.white
                                        .make(),
                                    "Post".text.xl.white.make()
                                  ],
                                ),
                                //No.of Following
                                Column(
                                  children: [
                                    "0".text.bold.xl3.white.make(),
                                    "Following".text.xl.white.make()
                                  ],
                                ),
                                //No.of Followers
                                Column(
                                  children: [
                                    "0".text.bold.xl3.white.make(),
                                    "Followers".text.xl.white.make()
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    20.h.heightBox,
                    //list of users post
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "My Posts".text.bold.xl2.make(),
                          15.h.heightBox,
                          //post list in grid view
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: state.data.posts!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.9,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              return MyPost(
                                post: state.data.posts![index],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
