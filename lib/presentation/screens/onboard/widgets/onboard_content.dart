part of 'onboard_content_imports.dart';

class OnBoardContent extends StatelessWidget {
  final String image;
  final String onBoardText;
  const OnBoardContent({
    super.key,
    required this.image,
    required this.onBoardText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //onBoard Image
        Image.asset(
          image,
          height: 333.h,
          width: 333.w,
          fit: BoxFit.cover,
        ),

        25.h.heightBox,
        //onBoard Description
        onBoardText.text
            .size(15.sp)
            .color(Colors.black)
            .align(TextAlign.center)
            .fontWeight(FontWeight.w500)
            .make()
      ],
    );
  }
}
