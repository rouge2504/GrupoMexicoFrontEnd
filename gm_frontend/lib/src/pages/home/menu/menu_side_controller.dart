import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuSideController extends GetxController {
  var indexBottomPage = 0.obs;

  MenuSideController() {
    indexBottomPage.value = 4;
  }

  void onTap(int index) {
    indexBottomPage.value = index;
    switch (index) {
      case 0:
        print('Home');
        Get.toNamed('/home');
        break;
      case 1:
        print('Destino on menu');
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
        break;
    }
  }
}
