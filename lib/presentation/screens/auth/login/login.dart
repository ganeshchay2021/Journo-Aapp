// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widget/login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSelected = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

            //Login Box
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
                  "Login"
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
                  10.h.heightBox,

                  //remember me and forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          //ceckbox for remember me
                          Checkbox(
                            checkColor: Colors.white,
                            side: const BorderSide(
                                color: MyColors.primaryColor, width: 2),
                            value: isSelected,
                            onChanged: (value) {
                              setState(() {
                                isSelected = !isSelected;
                              });
                            },
                          ),
                          "Remember me"
                              .text
                              .size(14)
                              .fontWeight(FontWeight.w500)
                              .color(MyColors.primaryColor)
                              .make()
                        ],
                      ),

                      //forgot password
                      GestureDetector(
                        onTap: () {},
                        child: "Forgot Password?"
                            .text
                            .size(14)
                            .color(MyColors.primaryColor)
                            .fontWeight(FontWeight.w500)
                            .make(),
                      )
                    ],
                  ),

                  20.h.heightBox,

                  //Login button
                  CustomButton(onTap: () {}, btnText: "Login"),
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
                                  .replace(const RegisterRoute());
                            },
                          text: " Login",
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
