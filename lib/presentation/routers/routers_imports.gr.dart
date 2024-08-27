// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:jurney_blog_app/presentation/screens/auth/widgets/auth_imports.dart'
    as _i1;
import 'package:jurney_blog_app/presentation/screens/onboard/widgets/onboard_imports.dart'
    as _i2;
import 'package:jurney_blog_app/presentation/screens/splash/splash_imports.dart'
    as _i3;

/// generated route for
/// [_i1.Auth]
class AuthRoute extends _i4.PageRouteInfo<void> {
  const AuthRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.Auth();
    },
  );
}

/// generated route for
/// [_i2.OnBoard]
class OnBoardRoute extends _i4.PageRouteInfo<void> {
  const OnBoardRoute({List<_i4.PageRouteInfo>? children})
      : super(
          OnBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.OnBoard();
    },
  );
}

/// generated route for
/// [_i3.Splash]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.Splash();
    },
  );
}
