import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jurney_blog_app/core/constant/my_strings.dart';
import 'package:jurney_blog_app/core/theme/app_theme.dart';
import 'package:jurney_blog_app/data/repositories/auth_repo.dart';
import 'package:jurney_blog_app/data/repositories/category_repo.dart';
import 'package:jurney_blog_app/data/repositories/home_repo.dart';
import 'package:jurney_blog_app/data/repositories/repository.dart';
import 'package:jurney_blog_app/data/repositories/tags_repo.dart';
import 'package:jurney_blog_app/presentation/screens/auth/login/cubit/login_cubit.dart';
import 'package:jurney_blog_app/presentation/screens/auth/login/cubit/logout_cubit.dart';
import 'package:jurney_blog_app/presentation/screens/general/category/bloc/category_bloc.dart';
import 'package:jurney_blog_app/presentation/screens/general/tags/bloc/tags_bloc.dart';
import 'presentation/routers/routers_imports.dart';

// void main() => runApp(
//   DevicePreview(
//     enabled: true,
//     builder: (context) => MyApp(), // Wrap your app
//   ),
// );
void main() {
  runApp(RepositoryProvider(
    create: (context) => Repository(
      tagsRepo: TagsRepo(),
      categoryRepo: CategoryRepo(),
      authRepo: AuthRepo(),
      homeRepo: HomeRepo(),
    ),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => TagsBloc(
                  repository: context.read<Repository>(),
                ),
              ),
              BlocProvider(
                create: (context) => CategoryBloc(
                  repository: context.read<Repository>(),
                ),
              ),
                BlocProvider(
                create: (context) => LoginCubit(
                  repository: context.read<Repository>(),
                ),
              ),
               BlocProvider(
                create: (context) => LogoutCubit(
                  repository: context.read<Repository>(),
                ),
              ),
            ],
            child: MaterialApp.router(
              title: MyString.appName,
              theme: AppTheme.lightMode,
              darkTheme: AppTheme.darkMode,
              routerConfig: _appRouter.config(),
            ),
          );
        });
  }
}
