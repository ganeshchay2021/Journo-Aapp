part of 'widget_imports.dart';

class HomePostTile extends StatelessWidget {
  final HomeModel homeModel;
  final int index;
  const HomePostTile({super.key, required this.homeModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context)
            .push(BlogDetailsRoute(post: homeModel.popularPosts![index]));
      },
      child: FadedScaleAnimation(
        child: Row(
          children: [
            //blog title image
            Hero(
              tag: Key(homeModel.popularPosts![index].id.toString()),
              child: CachedNetworkImage(
                imageUrl: homeModel.popularPosts![index].featuredimage!,
                imageBuilder: (context, imageProvider) => Container(
                  height: 120.h,
                  width: 170.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ).cornerRadius(18),
                placeholder: (context, url) => Container(
                  height: 120.h,
                  width: 170.w,
                  decoration: const BoxDecoration(color: Colors.grey),
                ).cornerRadius(18),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            10.w.widthBox,
            //blog Description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "${homeModel.popularPosts![index].title}"
                    .text
                    .overflow(TextOverflow.ellipsis)
                    .size(16)
                    .maxLines(2)
                    .fontWeight(FontWeight.bold)
                    .make(),
                10.h.heightBox,
                //blog uploaded timespan
                Row(
                  children: [
                    const Icon(
                      FeatherIcons.clock,
                      color: Colors.grey,
                    ),
                    5.w.widthBox,
                    homeModel.popularPosts![index].createdAt!
                        .timeAgo()
                        .text
                        .size(15)
                        .color(Colors.grey)
                        .make()
                  ],
                ),
                10.h.heightBox,
                //blog views
                Row(
                  children: [
                    "${homeModel.popularPosts![index].views} views"
                        .text
                        .size(15)
                        .color(Colors.grey)
                        .make(),
                    const Spacer(),
                    //Blog save Icons
                    const Icon(
                      FeatherIcons.bookmark,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ).expand()
          ],
        ),
      ),
    );
  }
}
