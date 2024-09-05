part of 'widgets/onboard_imports.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                //Logo
                const AppLogo(
                  logoColor: MyColors.primaryColor,
                ),
                63.h.heightBox,
                //onBoard Content (Image+Description)
                PageView.builder(
                  controller: onboardViewModel.pageController,
                  itemCount: onboardViewModel.onboardContent.length,
                  itemBuilder: (context, index) {
                    return onboardViewModel.onboardContent[index];
                  },
                ).expand(),
                //Get Started Button
                CustomButton(
                  btnText: "Get Started",
                  onTap: () {
                    AutoRouter.of(context).replace(const AuthRoute());
                  },
                ),
                61.h.heightBox,
                //Botton Action bar section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Skip"
                        .text
                        .size(16.sp)
                        .fontWeight(FontWeight.w700)
                        .color(MyColors.primaryColor)
                        .make(),

                    //smooth page indicator
                    SmoothPageIndicator(
                      controller: onboardViewModel.pageController,
                      count: onboardViewModel.onboardContent.length,
                      axisDirection: Axis.horizontal,
                      effect: WormEffect(
                        dotColor: MyColors.dotColor,
                        activeDotColor: MyColors.primaryColor,
                        dotHeight: 10.h,
                        dotWidth: 10.w,
                      ),
                    ),
                    "Next"
                        .text
                        .size(16.sp)
                        .fontWeight(FontWeight.w700)
                        .color(MyColors.primaryColor)
                        .make()
                  ],
                ),
                10.h.heightBox
              ],
            ),
          ),
        ),
      ),
    );
  }
}
