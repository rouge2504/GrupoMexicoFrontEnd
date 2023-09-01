import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();

  var pageIndex = 0.obs;

  void NextPage() {
    pageIndex++;
    pageController.nextPage(
        duration: Duration(microseconds: 30), curve: Curves.ease);
  }

  void BackPage() {
    pageIndex--;
    pageController.previousPage(
        duration: Duration(milliseconds: 30), curve: Curves.ease);
  }

  void onPageViewChange(int index) {
    pageIndex.value = index;
  }

  void goToLoginPage() {
    Get.toNamed('/login');
  }
}
