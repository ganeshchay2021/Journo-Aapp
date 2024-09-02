part of 'widgets/profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
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
      body: SingleChildScrollView(
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
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(MyAssets.netflixImage),
                  ),
                  10.h.heightBox,
                  //user's name
                  "Ganesh".text.bold.xl2.white.make(),
                  //user gmail
                  "ganeshchay2021@gmail.com".text.white.make(),
                  20.h.heightBox,
                  //About user
                  "Ganesh Chaudhary AKA (Ganpat) is a software engineer who is more passionate about technology. His ambition towards technology is huge"
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
                            "6".text.bold.xl3.white.make(),
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
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .9,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return const MyPost();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
