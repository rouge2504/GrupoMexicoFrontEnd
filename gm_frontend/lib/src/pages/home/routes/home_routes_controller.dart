import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeRoutesController extends GetxController {
  var indexBottomPage = 0.obs;

  HomeRoutesController() {
    indexBottomPage.value = 1;
  }

  void onTap(int index) {
    indexBottomPage.value = index;
    switch (index) {
      case 0:
        print('Home');
        Get.toNamed('/home');
        break;
      case 1:
        print('Destino');
        break;
      case 2:
        print('Ups');
        break;
      case 3:
        print('Media');
        break;
      case 4:
        print('Menu');
        Get.toNamed('/home/menu');
        break;
    }
  }
}
