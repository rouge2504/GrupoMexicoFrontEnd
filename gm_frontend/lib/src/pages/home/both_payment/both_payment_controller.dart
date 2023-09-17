import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BothPaymentController extends GetxController {
  PageController pageController = PageController();
  var activePage = 0.obs;
  var validForm = false.obs;

  void onPageViewChange(int page) {
    print(page);
    activePage.value = page;
  }

  void nextButton(BuildContext context) {
    activePage.value++;
    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
    print('NEXT BUTTON ${activePage.value}');
  }
}
