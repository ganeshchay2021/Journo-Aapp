part of 'widgets/auth_imports.dart';

@RoutePage()
class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    //background image
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(MyAssets.authBackgroundImage),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //App Logo
                const AppLogo().centered(),
                const Spacer(),

                //Auth Screen Destription
                "Explore the world,\nBillions of Thoughts."
                    .text
                    .color(MyColors.white)
                    .size(28.sp)
                    .fontWeight(FontWeight.w700)
                    .make(),
                20.h.heightBox,

                //got to login button
                CustomButton(
                  icon: Icons.arrow_forward,
                  onTap: () {
                       AutoRouter.of(context).replace(const LoginRoute());
                  },
                  btnText: "Login",
                ),
                12.h.heightBox,

                //got to login sign up button

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width, 44.h),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: MyColors.white),
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                    ),
                    onPressed: () {
                       AutoRouter.of(context).replace(const RegisterRoute());
                    },
                    //btn text and icon
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Register"
                            .text
                            .size(16.sp)
                            .color(MyColors.white)
                            .fontWeight(FontWeight.w700)
                            .make(),
                        5.w.widthBox,
                        Icon(
                          Icons.arrow_forward_ios,
                          color: MyColors.white,
                          size: 20.w,
                        )
                      ],
                    )),
                45.h.heightBox
              ],
            ),
          ),
        ),
      ),
    );
  }
}
