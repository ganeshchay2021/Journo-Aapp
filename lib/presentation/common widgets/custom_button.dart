// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:jurney_blog_app/core/constant/my_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String btnText;
  final IconData? icon;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.btnText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primaryColor,
        minimumSize: Size(MediaQuery.of(context).size.width, 44.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
        ),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "Login"
              .text
              .size(16.sp)
              .color(MyColors.white)
              .fontWeight(FontWeight.w700)
              .make(),
          5.w.widthBox,
          Icon(
            icon,
            color: MyColors.white,
            size: 20.w,
          )
        ],
      ),
    );
  }
}
