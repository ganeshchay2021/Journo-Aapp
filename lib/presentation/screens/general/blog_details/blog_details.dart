part of 'widgets/blog_details_imports.dart';

@RoutePage()
class BlogDetails extends StatefulWidget {
  const BlogDetails({super.key});

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  final String blog =
      "The emergence and growth of blogs in the late 1990s coincided with the advent of web publishing tools that facilitated the posting of content by non-technical users who did not have much experience with HTML or computer programming. Previously, knowledge of such technologies as HTML and File Transfer Protocol had been required to publish content on the Web, and early Web users therefore tended to be hackers and computer enthusiasts. As of the 2010s, the majority are interactive Web 2.0 websites, allowing visitors to leave online comments, and it is this interactivity that distinguishes them from other static websites. In that sense, blogging can be seen as a form of social networking service. Indeed, bloggers not only produce content to post on their blogs but also often build social relations with their readers and other bloggers. Blog owners or authors often moderate and filter online comments to remove hate speech or other offensive content. There are also high-readership blogs which do not allow comments.Many blogs provide commentary on a particular subject or topic, ranging from philosophy, religion, and arts to science, politics, and sports. Others function as more personal online diaries or online brand advertising of a particular individual or company. A typical blog combines text, digital images, and links to other blogs, web pages, and other media related to its topic. Blog and blogging are now loosely used for content creation and sharing on social media, especially when the content is long-form and one creates and shares content on regular basis, so one could be maintaining a blog on Facebook or blogging on Instagram. A 2022 estimate suggested that there were over 600 million public blogs out of more than 1.9 billion websites.";
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
        title: "Netflix will Charge Money For Password Sharing"
            .text
            .overflow(TextOverflow.ellipsis)
            .color(Colors.white)
            .make(),
      ),
      //page section
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Column(
          children: [
            //blog image
            Image.asset(
              MyAssets.netflixImage,
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            10.h.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  //blog title
                  "Netflix will Charge Money For Password Sharing"
                      .text
                      .bold
                      .xl2
                      .make(),
                      //blog views, like and disike
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //eye icon
                      const Icon(FeatherIcons.eye),
                      5.w.widthBox,
                      //blog views count
                      "147 Views".text.make(),
                      const Spacer(),
                      //like button
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FeatherIcons.thumbsUp,
                          color: Colors.green,
                        ),
                      ),
                      "0".text.make(),

                    //dislike button
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FeatherIcons.thumbsDown,
                          color: Colors.red,
                        ),
                      ),
                      "0".text.make(),
                    ],
                  ),
                  //blog readable paragraph
                  blog.text.lineHeight(1.5).align(TextAlign.justify).make()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
