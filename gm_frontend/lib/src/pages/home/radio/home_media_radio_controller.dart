import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeRoutesRadioController extends GetxController {
  var indexBottomPage = 0.obs;

  HomeRoutesRadioController() {
    indexBottomPage.value = 3;
    print("Routes Controller active");
  }

  void GoToRadio() {
    launchUrl(Uri.parse('https://alfaenlinea.com/'));
    print("Oprimiendo");
  }

  void GoToHome() {
    Get.toNamed('/home');
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
        Get.toNamed('/home/media');
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
