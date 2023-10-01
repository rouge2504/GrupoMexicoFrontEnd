import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/models/user.dart';

import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';

class MenuAccountController extends GetxController {
  var validForm = false.obs;
  PageController pageController = PageController();
  var activePage = 0.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  var passwordVisible = false.obs;
  var passwordConfirmVisible = false.obs;

  var selectedOption = 0.obs;

  ImagePicker picker = ImagePicker();
  File? imageFile;

  User user = User.fromJson(GetStorage().read('user') ?? {});
  void nextButton() {
    activePage.value++;
    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);

    print('NEXT BUTTON ${activePage.value}');
  }

  void GoToHome() {
    Get.toNamed('/home');
  }
}
