import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();

  void NextPage() {
    pageController.nextPage(
        duration: Duration(microseconds: 30), curve: Curves.ease);
  }
}
