import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:gm_frontend/src/providers/cars_provider.dart';

import 'package:gm_frontend/src/providers/users_provider.dart';

class InitSessionController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  UsersProvider usersProvider = UsersProvider();
  CarsProvider carsProvider = CarsProvider();

  var validForm = false.obs;

  var passwordVisible = false.obs;

  InitSessionController() {
    emailController.addListener(() {
      validForm.value =
          isValid(emailController.text.trim(), passwordController.text.trim());
    });

    passwordController.addListener(() {
      validForm.value =
          isValid(emailController.text.trim(), passwordController.text.trim());
    });
  }

  bool isValid(String email, String password) {
    if (email.isEmpty) {
      //Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (password.isEmpty) {
      //Get.snackbar('Formulario no valido', 'Debes ingresar el nombre');
      return false;
    }

    return true;
  }

  void Login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    if (isValidForm(email, password)) {
      ResponseApi responseApi = await usersProvider.login(email, password);
      print('Response Api!!!: ${responseApi.toJson()}');

      if (responseApi.success == true) {
        GetStorage().write('user', responseApi.data);
        User myUser = User.fromJson(GetStorage().read('user') ?? {});
        Get.toNamed('/home');
      } else {
        Get.snackbar('Login Fallido', responseApi.message ?? '');
      }
    }
  }

  bool isValidForm(String email, String password) {
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el email');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el password');
      return false;
    }

    return true;
  }
}
