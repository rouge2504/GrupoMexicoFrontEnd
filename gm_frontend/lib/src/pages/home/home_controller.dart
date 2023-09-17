import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:get_storage/get_storage.dart';

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
        Get.toNamed('/home/media');
        print('Media');
        break;
      case 4:
        print('Menu');
        Get.toNamed('/home/menu');
        break;
    }
    indexBottomPage.value = 0;
  }

  void goToRegisterCar() {
    Get.toNamed('/register_car');
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          title: const Text('Cancel booking'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want to cancel booking?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
