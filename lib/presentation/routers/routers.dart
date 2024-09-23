part of 'routers_imports.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: "/"),
        AutoRoute(page: OnBoardRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: GeneralRoute.page),
        AutoRoute(page: BlogDetailsRoute.page),
        AutoRoute(page: UserBlogDetailsRoute.page),
        AutoRoute(page: AddCategoryRoute.page),
        AutoRoute(page: UpdateCategoryRoute.page),
        AutoRoute(page: AddTagsRoute.page),
        AutoRoute(page: UpdateTagsRoute.page)

      ];
}
