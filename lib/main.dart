import 'package:flutter/material.dart';
import 'package:jurney_blog_app/core/constant/my_strings.dart';
import 'package:jurney_blog_app/core/theme/app_theme.dart';

import 'presentation/routers/routers_imports.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

   final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp.router(
      title: MyString.appName,
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      routerConfig: _appRouter.config(),
    
    );
  }
}
