import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:gm_frontend/src/pages/client/profile/info/client_profile_info_controller.dart';
import 'package:gm_frontend/src/providers/users_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class ClientProfileUpdateController extends GetxController {
  User user = User.fromJson(GetStorage().read('user'));
  ClientProfileInfoController clientProfileInfoController = Get.find();
  UsersProvider usersProvider = UsersProvider();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  ImagePicker picker = ImagePicker();
  File? imageFile;

  ClientProfileUpdateController() {
    nameController.text = user.name ?? '';
    lastNameController.text = user.lastname ?? '';
    phoneController.text = user.phone ?? '';
  }

  void updateInfo(BuildContext context) async {
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phone = phoneController.text.trim();
    print('fuck ${user.id}');

    if (isValidForm(name, lastName, phone)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: 'Actualizando Datos...');
      User myUser = User(
        id: user.id,
        name: name,
        lastname: lastName,
        phone: phone,
        sessionToken: user.sessionToken,
      );
      if (imageFile == null) {
        progressDialog.close();

        ResponseApi responseApi = await usersProvider.update(myUser);
        print('Response Api Update: ${responseApi.data}');

        Get.snackbar('Proceso terminado', responseApi.data ?? '');
        if (responseApi.success == true) {
          GetStorage().write('user', responseApi.data);
          clientProfileInfoController.user.value =
              User.fromJson(GetStorage().read('user') ?? {});
        }
      } else {
        Stream stream = await usersProvider.updateWithImage(myUser, imageFile!);
        stream.listen((res) {
          progressDialog.close();
          ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));
          print('Response Api Update: ${responseApi.data}');
          Get.snackbar('Proceso terminado', responseApi.data ?? '');
          if (responseApi.success == true) {
            GetStorage().write('user', responseApi.data);
            clientProfileInfoController.user.value =
                User.fromJson(GetStorage().read('user') ?? {});
          } else {
            Get.snackbar('Registro fallido', responseApi.message ?? '');
          }
        });
      }
    }
  }

  bool isValidForm(String name, String lastName, String phone) {
    if (name.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el nombre');
      return false;
    }

    if (lastName.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el apellido');
      return false;
    }

    if (phone.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el numero');
      return false;
    }

    return true;
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
}
