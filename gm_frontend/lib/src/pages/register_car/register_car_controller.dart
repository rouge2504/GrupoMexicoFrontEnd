import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:gm_frontend/src/providers/users_provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCarController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  PageController pageController = PageController();

  UsersProvider usersProvider = UsersProvider();

  var email = ''.obs;
  var name = ''.obs;
  var lastName = ''.obs;
  var phone = ''.obs;

  var validForm = false.obs;
  var validFormPassword = false.obs;

  var activePage = 0.obs;

  var passwordVisible = false.obs;
  var passwordConfirmVisible = false.obs;

  ImagePicker picker = ImagePicker();
  File? imageFile;

  RegisterCarController() {
    emailController.addListener(() {
      validForm.value = isValid(
          emailController.text.trim(),
          nameController.text.trim(),
          lastNameController.text.trim(),
          phoneController.text.trim());
    });
    nameController.addListener(() {
      validForm.value = isValid(
          emailController.text.trim(),
          nameController.text.trim(),
          lastNameController.text.trim(),
          phoneController.text.trim());
    });
    phoneController.addListener(() {
      validForm.value = isValid(
          emailController.text.trim(),
          nameController.text.trim(),
          lastNameController.text.trim(),
          phoneController.text.trim());
    });

    passwordController.addListener(() {
      validFormPassword.value = isValidPassword(passwordController.text.trim(),
          passwordConfirmController.text.trim());
    });

    passwordConfirmController.addListener(() {
      validFormPassword.value = isValidPassword(passwordController.text.trim(),
          passwordConfirmController.text.trim());
    });
  }

  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.gallery);
        },
        child: Text(
          'GALERIA',
          style: TextStyle(color: Colors.black),
        ));
    Widget cameraButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.camera);
        },
        child: Text(
          'CAMARA',
          style: TextStyle(color: Colors.black),
        ));

    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona una opcion'),
      actions: [galleryButton, cameraButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void onPageViewChange(int page) {
    print(page);
    activePage.value = page;
  }

  void nextButton() {
    activePage.value++;
    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);

    print('NEXT BUTTON ${activePage.value}');
  }

  void register(BuildContext context) async {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();

    User user = User(
        email: email,
        name: name,
        lastname: lastName,
        phone: phone,
        password: password);
    if (isValidForm(email, name, lastName, phone)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: 'Registrando Datos...');
      ResponseApi responseApi = await usersProvider.createUser(user);
      if (responseApi != null) {
        if (responseApi.success!) {
          progressDialog.close();
          user.id = responseApi.data.toString();
          GetStorage().write('user', user);
          Get.snackbar('Login Exitoso', responseApi.message ?? '');
          goToHomePage();
        } else {
          progressDialog.close();
          Get.snackbar('Algo salio mal', '');
        }
      }
    } else {
      print('Algo salio terriblemente mal');
    }
  }

  void goToHomePage() {
    Get.offNamedUntil('/home', (route) => false);
  }

  bool isValidForm(String email, String name, String lastName, String phone) {
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

  bool isValid(String email, String name, String lastName, String phone) {
    if (email.isEmpty) {
      //Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (name.isEmpty) {
      //Get.snackbar('Formulario no valido', 'Debes ingresar el nombre');
      return false;
    }

    if (lastName.isEmpty) {
      //Get.snackbar('Formulario no valido', 'Debes ingresar el nombre');
      return false;
    }

    if (phone.isEmpty) {
      //Get.snackbar('Formulario no valido', 'Debes ingresar el numero');
      return false;
    }

    return true;
  }

  bool isValidPassword(String password, String passwordConfirm) {
    if (password.isEmpty) {
      //Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (passwordConfirm.isEmpty) {
      //Get.snackbar('Formulario no valido', 'Debes ingresar el nombre');
      return false;
    }

    return true;
  }
}
