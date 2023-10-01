import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/src/models/Car.dart';
import 'package:gm_frontend/src/models/user.dart';

class BothPaymentController extends GetxController {
  PageController pageController = PageController();
  var activePage = 0.obs;
  var validForm = false.obs;
  User user = User.fromJson(GetStorage().read('user') ?? {});
  List<Car> cars = <Car>[].obs;

  var carAlias = "".obs;
  var carEdges = "".obs;

  BothPaymentController() {
    for (var i = 0; i < user.cars!.length; i++) {
      cars.add(user.cars![i]);
    }
  }
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
