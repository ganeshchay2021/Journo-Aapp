import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jurney_blog_app/core/constant/my_strings.dart';
import 'package:jurney_blog_app/core/theme/app_theme.dart';
import 'presentation/routers/routers_imports.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        title: MyString.appName,
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
