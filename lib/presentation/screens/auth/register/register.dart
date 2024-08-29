part of 'widgets/register_imports.dart';

@RoutePage()
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isSelected = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            50.h.heightBox,

            //app Logo
            const AppLogo().centered(),
            100.h.heightBox,
            
            //Register Box
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  50.h.heightBox,

                  //text
                  "Register"
                      .text
                      .size(20)
                      .fontWeight(FontWeight.w700)
                      .color(MyColors.primaryColor)
                      .make()
                      .centered(),
                  50.h.heightBox,

                  //Emain Text field
                  "Email".text.size(16).fontWeight(FontWeight.w500).make(),
                  8.h.heightBox,
                  CustomTextField(
                      hintText: "Enter email address",
                      icon: Icons.email,
                      controller: emailController,
                      validator: (value) {},
                      textInputType: TextInputType.emailAddress),
                  20.h.heightBox,

                  //Password Textfield
                  "Password".text.size(16).fontWeight(FontWeight.w500).make(),
                  8.h.heightBox,
                  CustomTextField(
                    hintText: "Enter password",
                    icon: Icons.lock,
                    controller: passwordController,
                    validator: (value) {},
                    isPassword: true,
                    obsureText: true,
                  ),
                  20.h.heightBox,

                  //Confirm Password Textfield
                  "Confirm Password"
                      .text
                      .size(16)
                      .fontWeight(FontWeight.w500)
                      .make(),
                  8.h.heightBox,
                  CustomTextField(
                    hintText: "Enter confirm password",
                    icon: Icons.lock,
                    controller: confirmPasswordController,
                    validator: (value) {},
                    isPassword: true,
                    obsureText: true,
                  ),
                  30.h.heightBox,

                  //Register button
                  CustomButton(onTap: () {}, btnText: "Register"),
                  30.h.heightBox,
                  
                  //bottom Text
                  "Already have an account?"
                      .richText
                      .size(14)
                      .color(MyColors.primaryColor)
                      .withTextSpanChildren([
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              AutoRouter.of(context)
                                  .replace(const LoginRoute());
                            },
                          text: " Register",
                          style: const TextStyle(
                              fontSize: 14,
                              color: MyColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        )
                      ])
                      .make()
                      .centered()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
