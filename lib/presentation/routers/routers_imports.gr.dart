// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:jurney_blog_app/presentation/screens/auth/login/widget/login_imports.dart'
    as _i4;
import 'package:jurney_blog_app/presentation/screens/auth/register/widgets/register_imports.dart'
    as _i6;
import 'package:jurney_blog_app/presentation/screens/auth/widgets/auth_imports.dart'
    as _i1;
import 'package:jurney_blog_app/presentation/screens/general/blog_details/widgets/blog_details_imports.dart'
    as _i2;
import 'package:jurney_blog_app/presentation/screens/general/home/widgets/home_model.dart'
    as _i11;
import 'package:jurney_blog_app/presentation/screens/general/profile/widgets/profile_model.dart'
    as _i12;
import 'package:jurney_blog_app/presentation/screens/general/profile/widgets/widgets_imports.dart'
    as _i8;
import 'package:jurney_blog_app/presentation/screens/general/widgets/general_imports.dart'
    as _i3;
import 'package:jurney_blog_app/presentation/screens/onboard/widgets/onboard_imports.dart'
    as _i5;
import 'package:jurney_blog_app/presentation/screens/splash/splash_imports.dart'
    as _i7;

/// generated route for
/// [_i1.Auth]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.Auth();
    },
  );
}

/// generated route for
/// [_i2.BlogDetails]
class BlogDetailsRoute extends _i9.PageRouteInfo<BlogDetailsRouteArgs> {
  BlogDetailsRoute({
    _i10.Key? key,
    required _i11.Post post,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          BlogDetailsRoute.name,
          args: BlogDetailsRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'BlogDetailsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BlogDetailsRouteArgs>();
      return _i2.BlogDetails(
        key: args.key,
        post: args.post,
      );
    },
  );
}

class BlogDetailsRouteArgs {
  const BlogDetailsRouteArgs({
    this.key,
    required this.post,
  });

  final _i10.Key? key;

  final _i11.Post post;

  @override
  String toString() {
    return 'BlogDetailsRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i3.General]
class GeneralRoute extends _i9.PageRouteInfo<void> {
  const GeneralRoute({List<_i9.PageRouteInfo>? children})
      : super(
          GeneralRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.General();
    },
  );
}

/// generated route for
/// [_i4.Login]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.Login();
    },
  );
}

/// generated route for
/// [_i5.OnBoard]
class OnBoardRoute extends _i9.PageRouteInfo<void> {
  const OnBoardRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OnBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnBoard();
    },
  );
}

/// generated route for
/// [_i6.Register]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.Register();
    },
  );
}

/// generated route for
/// [_i7.Splash]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.Splash();
    },
  );
}

/// generated route for
/// [_i8.UserBlogDetails]
class UserBlogDetailsRoute extends _i9.PageRouteInfo<UserBlogDetailsRouteArgs> {
  UserBlogDetailsRoute({
    _i10.Key? key,
    required _i12.Post post,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          UserBlogDetailsRoute.name,
          args: UserBlogDetailsRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'UserBlogDetailsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserBlogDetailsRouteArgs>();
      return _i8.UserBlogDetails(
        key: args.key,
        post: args.post,
      );
    },
  );
}

class UserBlogDetailsRouteArgs {
  const UserBlogDetailsRouteArgs({
    this.key,
    required this.post,
  });

  final _i10.Key? key;

  final _i12.Post post;

  @override
  String toString() {
    return 'UserBlogDetailsRouteArgs{key: $key, post: $post}';
  }
}
