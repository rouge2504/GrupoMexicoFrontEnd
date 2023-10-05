import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:get_storage/get_storage.dart';

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

  void GoToCar() {
    Get.toNamed('/home/menu/car');
    print('Oprimeindo');
  }

  void GoToPaymentMethods() {
    Get.toNamed('/home/menu/payment_methods');
    print('Oprimeindo');
  }

  void GoToAbout() {
    Get.toNamed('/home/menu/about');
    print('Oprimeindo');
  }

  void GoToNotification() {
    Get.toNamed('/home/menu/notification');
    print('Oprimeindo');
  }

  void GoToSuggestion() {
    Get.toNamed('/home/menu/suggestion');
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

  void PopUpWindow(BuildContext context) {
    print('Open Pop Up');
    return WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.all(6),
          elevation: 10,
          titlePadding: const EdgeInsets.all(0.0),
          title: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [getCloseButton(context), popUpWelcome(context)],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget popUpWelcome(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        children: [
          Text(
            '¿Quieres cerrar sesión?',
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          buttonCancel(context),
          SizedBox(
            height: 10,
          ),
          buttonCloseSession(context),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget buttonCancel(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              side: BorderSide(
                  width: 1.0, color: Theme.of(context).colorScheme.primary),
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'No, cancelar',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget buttonCloseSession(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
          onPressed: () {
            //Navigator.pop(context);
            //GetStorage().write(PreferenceApp.POP_UP_HOME, true);
            GetStorage().remove('user');
            Get.offNamedUntil('/login', (route) => false);
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'Si, cerrar',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget getCloseButton(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: FractionalOffset.topRight,
          child: GestureDetector(
            child: ImageIcon(
              AssetImage(Assets.CLOSE_ROUNDED_ICON),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
