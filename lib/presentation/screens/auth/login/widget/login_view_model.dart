part of 'login_imports.dart';

class LoginViewModel {
  final Repository repository;
  LoginViewModel({required this.repository});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  login(context) async {
    // var loginData = await repository.authRepo.userLogin(
    //     email: emailController.text,
    //     password: passwordController.text,
    //     );

    // if (loginData.accessToken != null) {
    //   Utils.saveToken(token: loginData.accessToken.toString());
    // }
  }
}
