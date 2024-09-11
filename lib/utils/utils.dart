import 'package:auto_route/auto_route.dart';
import 'package:jurney_blog_app/presentation/routers/routers_imports.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static const String _token = "token";

  //Login Manipulation
  static Future<void> loginManipulation(context) async {
    final token = await getToken();
    if (token != null) {
      AutoRouter.of(context).replace(const GeneralRoute());
    } else {
      AutoRouter.of(context).replace(const AuthRoute());
    }
  }

  //save token
  static Future<void> saveToken({required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, token);
  }

  //fetch token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }

  //delete token
  static Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_token);
  }
}
