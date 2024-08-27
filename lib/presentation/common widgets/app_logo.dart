// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jurney_blog_app/core/constant/my_assets.dart';

class AppLogo extends StatelessWidget {
  final Color? logoColor;
  const AppLogo({
    super.key,
     this.logoColor,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      MyAssets.journoLogo,
      height: 42.h,
      width: 139.h,
      color:logoColor,
    );
  }
}
