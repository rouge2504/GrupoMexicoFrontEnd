import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/models/Car.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import 'package:gm_frontend/src/providers/cars_provider.dart';

class HomeController extends GetxController {
  var indexBottomPage = 0.obs;
  CarsProvider carsProvider = CarsProvider();
  HomeController() {
    indexBottomPage.value = 0;
    print("Home Controller active");
  }

  void onTap(int index) {
    indexBottomPage.value = index;

    switch (index) {
      case 0:
        print('Home');
        break;
      case 1:
        print('Destino');
        Get.toNamed('/home/routes');
        break;
      case 2:
        print('Ups');
        break;
      case 3:
        Get.toNamed('/home/media');
        print('Media');
        break;
      case 4:
        print('Menu');
        Get.toNamed('/home/menu');
        break;
    }
    indexBottomPage.value = 0;
  }

  void goToRegisterCar() {
    Get.toNamed('/register_car');
  }

  void getCars(BuildContext context) async {
    User? user = User.fromJson(GetStorage().read('user'));
    ResponseApi responseApi = await carsProvider.getCars(user.id!);
    ProgressDialog progressDialog = ProgressDialog(context: context);

    progressDialog.show(max: 100, msg: 'Obteniendo Datos...');

    if (responseApi.success!) {
      progressDialog.close();
      List<Car> cars = Car.fromJsonList(responseApi.data);
      user.cars = cars;
      print('GET CAR:  ${user.toJson()}');
      GetStorage().write('user', user.toJson());
    }
  }

  void goToBothPayment(BuildContext context) async {
    User? user = User.fromJson(GetStorage().read('user'));
    ResponseApi responseApi = await carsProvider.getCars(user.id!);
    ProgressDialog progressDialog = ProgressDialog(context: context);

    progressDialog.show(max: 100, msg: 'Obteniendo Datos...');

    if (responseApi.success!) {
      progressDialog.close();

      //Iterable l = json.decode(responseApi.data.toString());
      //List<Car> cars = List<Car>.from(l.map((model) => Car.fromJson(model)));
      List<Car> cars = Car.fromJsonList(responseApi.data);
      user.cars = cars;
      Map temp = user.toJson();
      print('GET CAR:  ${user.toJson()}');
      GetStorage().write('user', user.toJson());
      Get.toNamed('/home/both_payment');
      Get.snackbar('Obtencion de datos', 'Listos para cobrar');

      print('Go to both payment');
    } else {
      Get.snackbar('Hubo un error', '');
      progressDialog.close();
    }
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          title: const Text('Cancel booking'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want to cancel booking?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
