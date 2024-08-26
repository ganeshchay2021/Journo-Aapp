import 'package:flutter/material.dart';
import 'package:jurney_blog_app/core/constant/my_assets.dart';
import 'package:jurney_blog_app/core/constant/my_strings.dart';
import 'package:jurney_blog_app/presentation/screens/onboard/widgets/onboard_content_imports.dart';

class OnboardViewModel {
  //instance of page controller created
  final PageController pageController = PageController();

  //list of onboardcontent widget
  final List<OnBoardContent> onboardContent = [
    const OnBoardContent(
        image: MyAssets.onBoardingImage1, onBoardText: MyString.obBoardText1),
    const OnBoardContent(
      image: MyAssets.onBoardingImage2,
      onBoardText: MyString.obBoardText2,
    ),
    const OnBoardContent(
        image: MyAssets.onBoardingImage3, onBoardText: MyString.obBoardText3)
  ];
}
