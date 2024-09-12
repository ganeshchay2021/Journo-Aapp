import 'package:auto_route/auto_route.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jurney_blog_app/presentation/routers/routers_imports.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static const String _tokenKey = "token";
  static const String _emailKey="email";
  static const String _passwordKey="password";

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
    await prefs.setString(_tokenKey, token);
  }

  //fetch token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  //delete token
  static Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_tokenKey);
  }

  //Function save the login credential
  static Future<void> saveLoginCredential(
      ({String email, String password}) loginData) async {
    await storage.write(key: _emailKey, value: loginData.email);
    await storage.write(key: _passwordKey, value: loginData.password);
  }

  //Function Fetch the login credential
  static Future<({String email, String password})> getLoginCredential() async {
    final email = await storage.read(key: _emailKey);
    final password = await storage.read(key: _passwordKey);
    return (email: email ?? "", password: password ?? "");
  }
}
