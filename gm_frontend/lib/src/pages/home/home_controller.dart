import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var indexBottomPage = 0.obs;

  void onTap(int index) {
    indexBottomPage.value = index;
    switch (index) {
      case 0:
        print('Home');
        break;
      case 1:
        print('Destino');
        break;
    }
  }
}
