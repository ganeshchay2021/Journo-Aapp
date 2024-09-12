part of 'widgets_imports.dart';

@RoutePage()
class UserBlogDetails extends StatefulWidget {
  final Post post;
  const UserBlogDetails({
    super.key,
    required this.post,
  });

  @override
  State<UserBlogDetails> createState() => _UserBlogDetailsState();
}

class _UserBlogDetailsState extends State<UserBlogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        //back icon button
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: MyColors.white,
          ),
        ),
        //page title
        title: widget.post.title!.text
            .overflow(TextOverflow.ellipsis)
            .color(Colors.white)
            .make(),
      ),
      //page section
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            //blog image
            Hero(
              tag: Key(widget.post.id.toString()),
              child: Image.network(
                widget.post.featuredimage!
                    .toString()
                    .prepend("https://techblog.codersangam.com/")
                    .replaceAll("public", "storage"),
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            10.h.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  //blog title
                  widget.post.title!.text.bold.xl2.make(),
                  //blog views, like and disike
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //eye icon
                      const Icon(FeatherIcons.eye),
                      5.w.widthBox,
                      //blog views count
                      "${widget.post.views!} views".text.make(),
                      const Spacer(),
                      //like button
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FeatherIcons.thumbsUp,
                          color: Colors.green,
                        ),
                      ),
                      "${widget.post.like}".text.make(),

                      //dislike button
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FeatherIcons.thumbsDown,
                          color: Colors.red,
                        ),
                      ),
                      "${widget.post.dislike}".text.make(),
                    ],
                  ),
                  //blog readable paragraph
                  HtmlWidget(
                    widget.post.body!,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
