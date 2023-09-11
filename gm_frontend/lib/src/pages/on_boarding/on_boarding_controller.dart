import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/utils/preferences_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();

  var pageIndex = 0.obs;
  //final Future<SharedPreferences> pref = SharedPreferences.getInstance();

  OnBoardingController() {
    init();
  }

  void init() async {
    await GetStorage.init();
    print(GetStorage().read(PreferenceApp.ON_BOARDING_ACTIVE));
  }

  /*void init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? onBoardingActive =
        prefs.getBool(PreferenceApp.ON_BOARDING_ACTIVE) ?? false;

    if (onBoardingActive) {
      Get.toNamed('/register');
    }
  }*/

  void NextPage() {
    pageIndex++;
    pageController.nextPage(
        duration: Duration(microseconds: 30), curve: Curves.ease);
  }

  void BackPage() {
    pageIndex--;
    pageController.previousPage(
        duration: Duration(milliseconds: 30), curve: Curves.ease);
  }

  void onPageViewChange(int index) {
    pageIndex.value = index;
  }

  void goToLoginPage() {
    Get.toNamed('/login');
    GetStorage().write(PreferenceApp.ON_BOARDING_ACTIVE, true);
    print(GetStorage().read(PreferenceApp.ON_BOARDING_ACTIVE));
  }
}
