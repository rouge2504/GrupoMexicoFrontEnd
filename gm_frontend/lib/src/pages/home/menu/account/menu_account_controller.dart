import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  ImagePicker picker = ImagePicker();
  File? imageFile;
  void nextButton() {
    activePage.value++;
    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);

    print('NEXT BUTTON ${activePage.value}');
  }
}
