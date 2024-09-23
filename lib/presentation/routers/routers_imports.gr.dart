// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:jurney_blog_app/presentation/screens/auth/login/widget/login_imports.dart'
    as _i6;
import 'package:jurney_blog_app/presentation/screens/auth/register/widgets/register_imports.dart'
    as _i8;
import 'package:jurney_blog_app/presentation/screens/auth/widgets/auth_imports.dart'
    as _i3;
import 'package:jurney_blog_app/presentation/screens/general/blog_details/widgets/blog_details_imports.dart'
    as _i4;
import 'package:jurney_blog_app/presentation/screens/general/category/widgets/add_category_imports.dart'
    as _i1;
import 'package:jurney_blog_app/presentation/screens/general/category/widgets/update_category_imports.dart'
    as _i10;
import 'package:jurney_blog_app/presentation/screens/general/home/widgets/home_model.dart'
    as _i14;
import 'package:jurney_blog_app/presentation/screens/general/profile/widgets/profile_model.dart'
    as _i15;
import 'package:jurney_blog_app/presentation/screens/general/profile/widgets/widgets_imports.dart'
    as _i11;
import 'package:jurney_blog_app/presentation/screens/general/tags/widgets/tags_imports.dart'
    as _i2;
import 'package:jurney_blog_app/presentation/screens/general/widgets/general_imports.dart'
    as _i5;
import 'package:jurney_blog_app/presentation/screens/onboard/widgets/onboard_imports.dart'
    as _i7;
import 'package:jurney_blog_app/presentation/screens/splash/splash_imports.dart'
    as _i9;

/// generated route for
/// [_i1.AddCategory]
class AddCategoryRoute extends _i12.PageRouteInfo<void> {
  const AddCategoryRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AddCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCategoryRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddCategory();
    },
  );
}

/// generated route for
/// [_i2.AddTags]
class AddTagsRoute extends _i12.PageRouteInfo<void> {
  const AddTagsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AddTagsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTagsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddTags();
    },
  );
}

/// generated route for
/// [_i3.Auth]
class AuthRoute extends _i12.PageRouteInfo<void> {
  const AuthRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i3.Auth();
    },
  );
}

/// generated route for
/// [_i4.BlogDetails]
class BlogDetailsRoute extends _i12.PageRouteInfo<BlogDetailsRouteArgs> {
  BlogDetailsRoute({
    _i13.Key? key,
    required _i14.Post post,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          BlogDetailsRoute.name,
          args: BlogDetailsRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'BlogDetailsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BlogDetailsRouteArgs>();
      return _i4.BlogDetails(
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

  final _i13.Key? key;

  final _i14.Post post;

  @override
  String toString() {
    return 'BlogDetailsRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i5.General]
class GeneralRoute extends _i12.PageRouteInfo<void> {
  const GeneralRoute({List<_i12.PageRouteInfo>? children})
      : super(
          GeneralRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i5.General();
    },
  );
}

/// generated route for
/// [_i6.Login]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i6.Login();
    },
  );
}

/// generated route for
/// [_i7.OnBoard]
class OnBoardRoute extends _i12.PageRouteInfo<void> {
  const OnBoardRoute({List<_i12.PageRouteInfo>? children})
      : super(
          OnBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i7.OnBoard();
    },
  );
}

/// generated route for
/// [_i8.Register]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i8.Register();
    },
  );
}

/// generated route for
/// [_i9.Splash]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i9.Splash();
    },
  );
}

/// generated route for
/// [_i10.UpdateCategory]
class UpdateCategoryRoute extends _i12.PageRouteInfo<UpdateCategoryRouteArgs> {
  UpdateCategoryRoute({
    _i13.Key? key,
    required String id,
    required String title,
    required String slug,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          UpdateCategoryRoute.name,
          args: UpdateCategoryRouteArgs(
            key: key,
            id: id,
            title: title,
            slug: slug,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateCategoryRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateCategoryRouteArgs>();
      return _i10.UpdateCategory(
        key: args.key,
        id: args.id,
        title: args.title,
        slug: args.slug,
      );
    },
  );
}

class UpdateCategoryRouteArgs {
  const UpdateCategoryRouteArgs({
    this.key,
    required this.id,
    required this.title,
    required this.slug,
  });

  final _i13.Key? key;

  final String id;

  final String title;

  final String slug;

  @override
  String toString() {
    return 'UpdateCategoryRouteArgs{key: $key, id: $id, title: $title, slug: $slug}';
  }
}

/// generated route for
/// [_i2.UpdateTags]
class UpdateTagsRoute extends _i12.PageRouteInfo<UpdateTagsRouteArgs> {
  UpdateTagsRoute({
    _i13.Key? key,
    required String id,
    required String title,
    required String slug,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          UpdateTagsRoute.name,
          args: UpdateTagsRouteArgs(
            key: key,
            id: id,
            title: title,
            slug: slug,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateTagsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateTagsRouteArgs>();
      return _i2.UpdateTags(
        key: args.key,
        id: args.id,
        title: args.title,
        slug: args.slug,
      );
    },
  );
}

class UpdateTagsRouteArgs {
  const UpdateTagsRouteArgs({
    this.key,
    required this.id,
    required this.title,
    required this.slug,
  });

  final _i13.Key? key;

  final String id;

  final String title;

  final String slug;

  @override
  String toString() {
    return 'UpdateTagsRouteArgs{key: $key, id: $id, title: $title, slug: $slug}';
  }
}

/// generated route for
/// [_i11.UserBlogDetails]
class UserBlogDetailsRoute
    extends _i12.PageRouteInfo<UserBlogDetailsRouteArgs> {
  UserBlogDetailsRoute({
    _i13.Key? key,
    required _i15.Post post,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          UserBlogDetailsRoute.name,
          args: UserBlogDetailsRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'UserBlogDetailsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserBlogDetailsRouteArgs>();
      return _i11.UserBlogDetails(
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

  final _i13.Key? key;

  final _i15.Post post;

  @override
  String toString() {
    return 'UserBlogDetailsRouteArgs{key: $key, post: $post}';
  }
}
