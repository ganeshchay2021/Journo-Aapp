part of 'splash_imports.dart';

@RoutePage()
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    moveToOnBoard();
    super.initState();
  }

  moveToOnBoard() async {
    await Future.delayed(
      const Duration(seconds: 4),
      () {
        AutoRouter.of(context).push(const OnBoardRoute());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: FadedScaleAnimation(
          scaleDuration: const Duration(seconds: 2),
          //Loog for Splash Screen
          child: Image.asset(
            MyAssets.journoLogo,
            height: 42,
            width: 139,
          ),
        ),
      ),
    );
  }
}
