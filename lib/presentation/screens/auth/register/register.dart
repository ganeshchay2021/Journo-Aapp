part of 'widgets/register_imports.dart';

@RoutePage()
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              50.h.heightBox,

              //app Logo
              const AppLogo().centered(),
              100.h.heightBox,

              //Register Box
              BlocConsumer<RegisterCubit, CommonState>(
                listener: (context, state) {
                  if (state is CommonErrorState) {
                    VxToast.show(
                      context,
                      msg: state.errorMsg,
                      bgColor: Colors.red,
                      textColor: Colors.white,
                    );
                  }
                  if (state is CommonSuccessState<RegisterModel>) {
                    VxToast.show(
                      context,
                      msg: "User Registered",
                      bgColor: Colors.green,
                      textColor: Colors.white,
                    );
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
                  return FadedScaleAnimation(
                    child: Container(
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
                          30.h.heightBox,

                          //Name Text field
                          "Name"
                              .text
                              .size(16)
                              .fontWeight(FontWeight.w500)
                              .make(),
                          8.h.heightBox,
                          VxTextField(
                            controller: nameController,
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixColor: MyColors.primaryColor,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: MyColors.primaryColor,
                            ),
                            borderColor: MyColors.primaryColor,
                            borderRadius: 10,
                            borderType: VxTextFieldBorderType.roundLine,
                            hint: "Enter full name ",
                            fillColor: Colors.transparent,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is empty";
                              } else if (value.isValidName) {
                                return null;
                              } else {
                                return "Invalid name";
                              }
                            },
                          ),
                          20.h.heightBox,

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
                            hint: "Enter email ",
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
                              } else if (value.isValidPassword) {
                                return null;
                              } else {
                                return "Password must have 1 letter, 1 num & 1 special character (@#\$)";
                              }
                            },
                          ),
                          20.h.heightBox,

                          //Confirm Password Textfield
                          "Confirm Password"
                              .text
                              .size(16)
                              .fontWeight(FontWeight.w500)
                              .make(),
                          8.h.heightBox,
                          VxTextField(
                            controller: confirmPasswordController,
                            isPassword: true,
                            hintStyle: const TextStyle(color: Colors.grey),
                            obscureText: true,
                            suffixColor: MyColors.primaryColor,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: MyColors.primaryColor,
                            ),
                            borderColor: MyColors.primaryColor,
                            borderRadius: 10,
                            borderType: VxTextFieldBorderType.roundLine,
                            hint: "Re-type password",
                            fillColor: Colors.transparent,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is empty";
                              } else if (passwordController.text !=
                                  confirmPasswordController.text) {
                                return "Passwords doesn't matched";
                              } else {
                                return null;
                              }
                            },
                          ),
                          30.h.heightBox,

                          //Register button
                          CustomButton(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<RegisterCubit>().userRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              btnText: "Register"),
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
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
