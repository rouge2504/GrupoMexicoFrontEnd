import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  var email = ''.obs;
  var name = ''.obs;
  var phone = ''.obs;

  var validForm = false.obs;

  RegisterController() {
    emailController.addListener(() {
      validForm.value = isValid(emailController.text.trim(),
          nameController.text.trim(), phoneController.text.trim());
    });
    nameController.addListener(() {
      validForm.value = isValid(emailController.text.trim(),
          nameController.text.trim(), phoneController.text.trim());
    });
    phoneController.addListener(() {
      validForm.value = isValid(emailController.text.trim(),
          nameController.text.trim(), phoneController.text.trim());
    });
  }

  void register() {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();
    isValidForm(email, name, phone);
  }

  bool isValidForm(String email, String name, String phone) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (name.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el nombre');
      return false;
    }

    if (phone.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el numero');
      return false;
    }

    return true;
  }

  bool isValid(String email, String name, String phone) {
    if (email.isEmpty) {
      //Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (name.isEmpty) {
      //Get.snackbar('Formulario no valido', 'Debes ingresar el nombre');
      return false;
    }

    if (phone.isEmpty) {
      //Get.snackbar('Formulario no valido', 'Debes ingresar el numero');
      return false;
    }

    return true;
  }
}
