part of 'widgets/home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            //banner image
            Image.asset(
              MyAssets.netflixImage,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
            ).cornerRadius(18),
            20.h.heightBox,

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
                  return const HomePostTile();
                },
                separatorBuilder: (context, index) => 10.h.heightBox,
                itemCount: 5)
          ],
        ),
      ),
    ));
  }
}
