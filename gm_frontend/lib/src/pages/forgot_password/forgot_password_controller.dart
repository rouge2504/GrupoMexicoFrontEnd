import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/src/providers/users_provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  var email = ''.obs;
  var activePage = 0.obs;
  PageController pageController = PageController();
  UsersProvider usersProvider = UsersProvider();

  var passwordVisible = false.obs;
  var passwordConfirmVisible = false.obs;
  var validFormPassword = false.obs;
  var validForm = false.obs;

  void nextButton() {
    activePage.value++;
    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);

    print('NEXT BUTTON ${activePage.value}');
  }

  void onPageViewChange(int page) {
    print(page);
    activePage.value = page;
  }

  void register(BuildContext context) async {
    String email = emailController.text.trim();

    String password = passwordController.text.trim();
    String confirmPassword = passwordConfirmController.text.trim();

    User user = User(
        email: email,
        /*name: name,
        lastname: lastName,
        phone: phone,*/
        password: password,
        cars: [],
        cardModels: []);
    if (isValidForm(password, confirmPassword)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: 'Registrando Datos...');
      ResponseApi responseApi = await usersProvider.createUser(user);
      if (responseApi.data != null) {
        if (responseApi.success!) {
          progressDialog.close();
          user.id = responseApi.data.toString();
          GetStorage().write('user', user.toJson());
          Get.snackbar('Login Exitoso', responseApi.message ?? '');
          goToHomePage();
        } else {
          progressDialog.close();
          Get.snackbar('Algo salio mal', '');
        }
      } else {
        progressDialog.close();
        Get.snackbar('Algo salio mal', '');
      }
    } else {
      print('Algo salio terriblemente mal');
    }
  }
}

bool isValidForm(String password, String confirmPassword) {
  if (password.compareTo(confirmPassword) == 0) {
    return false;
  }
  return true;
}

void goToHomePage() {
  Get.offNamedUntil('/home', (route) => false);
}
