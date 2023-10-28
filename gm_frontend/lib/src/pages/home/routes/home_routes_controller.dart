import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeRoutesController extends GetxController {
  var indexBottomPage = 0.obs;

  HomeRoutesController() {
    indexBottomPage.value = 1;
    print("Routes Controller active");
  }

  void GoToHome() {
    Get.toNamed('/home');
  }

  void GoToGasStation() {
    Get.toNamed('/home/routes/gas_station');
  }

  void GoToTollboths() {
    Get.toNamed('/home/routes/tollboths');
    print('Go to tollboths');
  }

  void GoToServicesArea() {
    Get.toNamed('/home/routes/services_area');
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
        Get.toNamed('/home/routes');
        break;
      case 2:
        print('Ups');
        break;
      case 3:
        Get.toNamed('/home/radio');
        print('Media');
        break;
      case 4:
        print('Menu');
        Get.toNamed('/home/menu');
        break;
    }
    indexBottomPage.value = 1;
  }
}
