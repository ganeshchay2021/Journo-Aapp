part of 'widgets_imports.dart';

class MyPost extends StatelessWidget {
  const MyPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Image.asset(
            MyAssets.netflixImage,
            fit: BoxFit.cover,
          ).cornerRadius(10),
          6.h.heightBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Netflix will Charge Money For Password Sharing"
                  .text
                  .medium
                  .make()
                  .expand(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.moreVertical,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
