// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widget/login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSelected = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
            FadedScaleAnimation(
              child: Form(
                key: formKey,
                child: BlocConsumer<LoginCubit, CommonState>(
                  listener: (context, state) {
                    if (state is CommonErrorState) {
                      VxToast.show(context,
                          msg: state.errorMsg,
                          bgColor: Colors.red,
                          textColor: Colors.white);
                    }
                    if (state is CommonSuccessState<LoginModel>) {
                      AutoRouter.of(context).replace(const GeneralRoute());
                    }
                  },
                  builder: (context, state) {
                    if (state is CommonLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: MyColors.white,
                        ),
                      );
                    }
                    return Container(
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
                          "Email"
                              .text
                              .size(16)
                              .fontWeight(FontWeight.w500)
                              .make(),
                          8.h.heightBox,
                          VxTextField(
                            controller: emailController,
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixColor: MyColors.primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: MyColors.primaryColor,
                            ),
                            borderColor: MyColors.primaryColor,
                            borderRadius: 10,
                            borderType: VxTextFieldBorderType.roundLine,
                            hint: "Enter email address",
                            fillColor: Colors.transparent,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is empty";
                              } else if (EmailValidator.validate(value)) {
                                return null;
                              } else {
                                return "Invalid email";
                              }
                            },
                          ),
                          20.h.heightBox,

                          //Password Textfield
                          "Password"
                              .text
                              .size(16)
                              .fontWeight(FontWeight.w500)
                              .make(),
                          8.h.heightBox,
                          VxTextField(
                            controller: passwordController,
                            isPassword: true,
                            hintStyle: const TextStyle(color: Colors.grey),
                            obscureText: true,
                            suffixColor: MyColors.primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: MyColors.primaryColor,
                            ),
                            borderColor: MyColors.primaryColor,
                            borderRadius: 10,
                            borderType: VxTextFieldBorderType.roundLine,
                            hint: "Enter password",
                            fillColor: Colors.transparent,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is empty";
                              } else {
                                return null;
                              }
                            },
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
                          CustomButton(
                              onTap: (){
                                if (formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              btnText: "Login"),
                          30.h.heightBox,

                          //bottom Text
                          "Don't have an account?"
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
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
