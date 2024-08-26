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
          height: 333,
          width: 333,
        ),
        const SizedBox(
          height: 25,
        ),
        //onBoard Description
        onBoardText.text
            .size(15)
            .color(Colors.black)
            .align(TextAlign.center)
            .fontWeight(FontWeight.w500)
            .make()
      ],
    );
  }
}
