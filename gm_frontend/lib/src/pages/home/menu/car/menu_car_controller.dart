import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuCarController extends GetxController {
  var validForm = false.obs;
  PageController pageController = PageController();
  var activePage = 0.obs;

  TextEditingController aliasController = TextEditingController();
  TextEditingController numberPlateController = TextEditingController();
  TextEditingController markController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController edgesController = TextEditingController();

  ImagePicker picker = ImagePicker();
  File? imageFile;

  var selectedOption = 0.obs;

  void nextButton() {
    activePage.value++;
    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);

    print('NEXT BUTTON ${activePage.value}');
  }
}
