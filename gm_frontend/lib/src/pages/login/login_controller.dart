import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void goToInitSessionPage() {
    Get.toNamed('/init_session');
  }

  void goToForgotPassword() {
    Get.toNamed('/forgot_password');
  }
}
