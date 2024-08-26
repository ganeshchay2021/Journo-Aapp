part of 'onboard_imports.dart';

@RoutePage()
class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {

  //OnBoardModel Object Created
  OnboardViewModel onboardViewModel = OnboardViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                //Logo
                Image.asset(
                  MyAssets.journoLogo,
                  height: 42,
                  width: 139,
                  color: MyColors.primaryColor,
                ),
                const SizedBox(
                  height: 63,
                ),
                //onBoard Content (Image+Description)
                PageView.builder(
                  controller: onboardViewModel.pageController,
                  itemCount: onboardViewModel.onboardContent.length,
                  itemBuilder: (context, index) {
                    return onboardViewModel.onboardContent[index];
                  },
                ).expand(),
                //Get Started Button
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 61),
                  child: CustomButton(),
                ),
                //Botton Action bar section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Skip"
                        .text
                        .size(16)
                        .fontWeight(FontWeight.w700)
                        .color(MyColors.primaryColor)
                        .make(),
                    SmoothPageIndicator(
                        controller: onboardViewModel.pageController,
                        count: onboardViewModel.onboardContent.length,
                        axisDirection: Axis.horizontal,
                        effect: const WormEffect(
                          dotColor: MyColors.dotColor,
                          activeDotColor: MyColors.primaryColor,
                          dotHeight: 10,
                          dotWidth: 10,
                        )),
                    "Next"
                        .text
                        .size(16)
                        .fontWeight(FontWeight.w700)
                        .color(MyColors.primaryColor)
                        .make()
                  ],
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
