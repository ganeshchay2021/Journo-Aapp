
import 'package:flutter/material.dart';
import 'package:jurney_blog_app/core/constant/my_colors.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final TextEditingController controller;
  final bool isPassword;
  final bool obsureText;
  final FormFieldValidator validator;
  final TextInputType? textInputType;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    required this.controller,
    this.isPassword=false,
    this.obsureText=false,
    required this.validator,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return VxTextField(
      controller: controller,
      isPassword: isPassword,
      hintStyle: const TextStyle(color: Colors.grey),
      obscureText: obsureText,
      suffixColor: MyColors.primaryColor,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icon(
        icon,
        color: MyColors.primaryColor,
      ),
      borderColor: MyColors.primaryColor,
      borderRadius: 10,
      borderType: VxTextFieldBorderType.roundLine,
      hint: hintText,
      fillColor: Colors.transparent,
      validator: validator,
    );
  }
}
