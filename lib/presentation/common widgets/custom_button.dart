
import 'package:flutter/material.dart';
import 'package:jurney_blog_app/core/constant/my_colors.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primaryColor,
        minimumSize: Size(MediaQuery.of(context).size.width, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      onPressed: () {},
      child: "Get Started"
          .text
          .size(16)
          .color(MyColors.white)
          .fontWeight(FontWeight.w700)
          .make(),
    );
  }
}
