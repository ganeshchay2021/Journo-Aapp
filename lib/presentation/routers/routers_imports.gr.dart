// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:jurney_blog_app/presentation/screens/auth/login/widget/login_imports.dart'
    as _i2;
import 'package:jurney_blog_app/presentation/screens/auth/register/widgets/register_imports.dart'
    as _i4;
import 'package:jurney_blog_app/presentation/screens/auth/widgets/auth_imports.dart'
    as _i1;
import 'package:jurney_blog_app/presentation/screens/onboard/widgets/onboard_imports.dart'
    as _i3;
import 'package:jurney_blog_app/presentation/screens/splash/splash_imports.dart'
    as _i5;

/// generated route for
/// [_i1.Auth]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.Auth();
    },
  );
}

/// generated route for
/// [_i2.Login]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.Login();
    },
  );
}

/// generated route for
/// [_i3.OnBoard]
class OnBoardRoute extends _i6.PageRouteInfo<void> {
  const OnBoardRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OnBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.OnBoard();
    },
  );
}

/// generated route for
/// [_i4.Register]
class RegisterRoute extends _i6.PageRouteInfo<void> {
  const RegisterRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.Register();
    },
  );
}

/// generated route for
/// [_i5.Splash]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.Splash();
    },
  );
}
