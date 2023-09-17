import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuSideController extends GetxController {
  var indexBottomPage = 0.obs;

  MenuSideController() {
    indexBottomPage.value = 4;
  }
  void GoToHome() {
    Get.toNamed('/home');
  }

  void GoToAccount() {
    Get.toNamed('/home/menu/account');
    print('Oprimeindo');
  }

  void onTap(int index) {
    indexBottomPage.value = index;
    switch (index) {
      case 0:
        print('Home');
        super.dispose();
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
        Get.toNamed('/home/media');

        break;
      case 4:
        print('Menu');
        Get.toNamed('/home/menu');
        break;
    }
    indexBottomPage.value = 4;
  }
}
