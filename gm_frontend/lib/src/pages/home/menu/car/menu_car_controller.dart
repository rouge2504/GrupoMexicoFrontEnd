import 'package:gm_frontend/src/models/Car.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:gm_frontend/src/providers/cars_provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuCarController extends GetxController {
  User userSession =
      User() /*= User.fromJson(GetStorage().read('user') ?? {})*/;
  var validForm = false.obs;
  PageController pageController = PageController();
  CarsProvider carsProvider = CarsProvider();
  var activePage = 0.obs;

  TextEditingController aliasController = TextEditingController();
  TextEditingController numberPlateController = TextEditingController();
  TextEditingController markController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController edgeController = TextEditingController();

  ImagePicker picker = ImagePicker();
  File? imageFile;

  var selectedOption = 0.obs;

  var cars = <Car>[].obs;

  MenuCarController() {
    userSession = User.fromJson(GetStorage().read('user') ?? {});
    for (var i = 0; i < userSession.cars!.length; i++) {
      print('Car CAR CONTROLLER: ${userSession.cars![i].model}');
      cars.add(userSession.cars![i]);
    }

    if (userSession.cars!.isEmpty) {
      print("No hay ni un puñetero carro");
    }

    aliasController.addListener(() {
      validForm.value = isValid(
        aliasController.text.trim(),
        numberPlateController.text.trim(),
        markController.text.trim(),
        modelController.text.trim(),
        yearController.text.trim(),
        edgeController.text.trim(),
      );
    });
    numberPlateController.addListener(() {
      validForm.value = isValid(
        aliasController.text.trim(),
        numberPlateController.text.trim(),
        markController.text.trim(),
        modelController.text.trim(),
        yearController.text.trim(),
        edgeController.text.trim(),
      );
    });
    markController.addListener(() {
      validForm.value = isValid(
        aliasController.text.trim(),
        numberPlateController.text.trim(),
        markController.text.trim(),
        modelController.text.trim(),
        yearController.text.trim(),
        edgeController.text.trim(),
      );
    });

    modelController.addListener(() {
      validForm.value = isValid(
        aliasController.text.trim(),
        numberPlateController.text.trim(),
        markController.text.trim(),
        modelController.text.trim(),
        yearController.text.trim(),
        edgeController.text.trim(),
      );
    });

    yearController.addListener(() {
      validForm.value = isValid(
        aliasController.text.trim(),
        numberPlateController.text.trim(),
        markController.text.trim(),
        modelController.text.trim(),
        yearController.text.trim(),
        edgeController.text.trim(),
      );
    });

    edgeController.addListener(() {
      validForm.value = isValid(
        aliasController.text.trim(),
        numberPlateController.text.trim(),
        markController.text.trim(),
        modelController.text.trim(),
        yearController.text.trim(),
        edgeController.text.trim(),
      );
    });
  }

  void register(BuildContext context) async {
    print("Registrando");
    String alias = aliasController.text.trim();
    String numberPlate = numberPlateController.text.trim();
    String mark = markController.text.trim();
    String model = modelController.text.trim();
    String year = yearController.text.trim();
    String edges = edgeController.text.trim();

    Car car = Car(
        id: userSession.id,
        alias: alias,
        number_plate: numberPlate,
        mark: mark,
        model: model,
        year: year,
        edge: edges);
    if (isValidForm(alias, numberPlate, mark, model, year, edges)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: 'Registrando Datos del Carro...');
      ResponseApi responseApi = await carsProvider.createCar(car);
      if (responseApi != null) {
        if (responseApi.data != null) {
          progressDialog.close();
          car.id = responseApi.data.toString();
          //GetStorage().write('car', car);
          Get.snackbar('Registro Exitoso del carro', responseApi.message ?? '');
          //goToHomePage();
        } else {
          progressDialog.close();
          Get.snackbar(
              'Algo salio mal con el registro del carro, por favor intentalo más tarde',
              '');
        }
      }
    } else {
      print('Algo salio terriblemente mal');
    }
  }

  void DeleteCar(BuildContext context, String? numberPlate) async {
    print("Number Plate to Delete:  ${numberPlate}");
    ProgressDialog progressDialog = ProgressDialog(context: context);
    progressDialog.show(max: 100, msg: 'Borrando carro...');
    if (numberPlate == null) {
      print("A checar esta madre de los carros");
      ResponseApi responseApi = await carsProvider.getCars(userSession!.id);
      List<Car>? cars = Car.fromJsonList(responseApi.data);
      userSession.cars = cars;
      GetStorage().write('user', userSession.toJson());
    } else {
      ResponseApi responseApiDelete = await carsProvider.DeleteCar(numberPlate);
      if (responseApiDelete.success!) {
        progressDialog.close();
        userSession.cars!
            .removeWhere((item) => item.number_plate == numberPlate);
        Get.snackbar('Borrado de carro', '');
        //Get.toNamed('/home');
        cars.value = userSession.cars!;
        GetStorage().write('user', userSession.toJson());
      } else {
        progressDialog.close();
        Get.snackbar('Hubo un error intentelo mas tarde', '');
      }
    }
  }

  bool isValidForm(String alias, String numberPlate, String mark, String model,
      String year, String edges) {
    if (alias.isEmpty) {
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (numberPlate.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el nombre');
      return false;
    }

    if (mark.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el numero');
      return false;
    }

    if (model.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el numero');
      return false;
    }

    if (year.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el numero');
      return false;
    }
    if (edges.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el numero');
      return false;
    }

    return true;
  }

  bool isValid(String alias, String numberPlate, String mark, String model,
      String year, String edges) {
    if (alias.isEmpty) {
      //Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (numberPlate.isEmpty) {
      //Get.snackbar('Formulario no valido', 'Debes ingresar el nombre');
      return false;
    }

    if (mark.isEmpty) {
      //Get.snackbar('Formulario no valido', 'Debes ingresar el nombre');
      return false;
    }

    if (model.isEmpty) {
      //Get.snackbar('Formulario no valido', 'Debes ingresar el numero');
      return false;
    }

    if (year.isEmpty) {
      //Get.snackbar('Formulario no valido', 'Debes ingresar el numero');
      return false;
    }

    if (edges.isEmpty) {
      //Get.snackbar('Formulario no valido', 'Debes ingresar el numero');
      return false;
    }

    return true;
  }

  void nextButton() {
    activePage.value++;
    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);

    print('NEXT BUTTON ${activePage.value}');
  }
}
