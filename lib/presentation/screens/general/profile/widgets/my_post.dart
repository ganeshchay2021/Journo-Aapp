// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets_imports.dart';

class MyPost extends StatelessWidget {
  final Post post;
  const MyPost({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    var image = post.featuredimage!
        .toString()
        .prepend("https://techblog.codersangam.com/")
        .replaceAll("public", "storage");

    return GestureDetector(
      onTap: () {
          AutoRouter.of(context).push(UserBlogDetailsRoute(post: post));
      },
      child: Column(
        children: [
          Hero(
            tag: Key(post.id.toString()),
            child: CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                )),
              ).cornerRadius(18),
              placeholder: (context, url) => Container(
                height: 150.h,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.grey),
              ).cornerRadius(18),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          6.h.heightBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              post.title!.text.medium.maxLines(2).make().expand(),
              IconButton(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.zero,
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
