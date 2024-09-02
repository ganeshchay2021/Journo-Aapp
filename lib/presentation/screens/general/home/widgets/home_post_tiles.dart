part of 'widget_imports.dart';
class HomePostTile extends StatelessWidget {
  const HomePostTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AutoRouter.of(context).push(const BlogDetailsRoute());
      },
      child: Row(
        children: [
          //blog title image
          Image.asset(
            MyAssets.netflixImage,
            height: 120.h,
            width: 180.w,
            fit: BoxFit.cover,
          ).cornerRadius(18),
      
          10.w.widthBox,
      
          //blog Description
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Netflix Will Charge Money for Password Sharing"
                  .text
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
                  "6 months ago".text.size(15).color(Colors.grey).make()
                ],
              ),
              10.h.heightBox,
              //blog views
              Row(
                children: [
                  "59 views"
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
    );
  }
}
