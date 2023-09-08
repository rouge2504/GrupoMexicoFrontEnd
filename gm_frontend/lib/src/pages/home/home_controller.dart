import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var indexBottomPage = 0.obs;

  HomeController() {
    indexBottomPage.value = 0;
    print("Home Controller active");
  }

  void onTap(int index) {
    indexBottomPage.value = index;

    switch (index) {
      case 0:
        print('Home');
        break;
      case 1:
        print('Destino');
        Get.toNamed('/home/routes');
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
    indexBottomPage.value = 0;
  }
}
