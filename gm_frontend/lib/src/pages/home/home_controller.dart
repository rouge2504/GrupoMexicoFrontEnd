import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/main.dart';
import 'package:gm_frontend/src/environment/environment.dart';
import 'package:gm_frontend/src/models/Car.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/src/providers/accident_provider.dart';
import 'package:gm_frontend/src/providers/local_notification_provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:gm_frontend/src/providers/cars_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as location;

final Uri _url = Uri.parse('https://flutter.dev');

class HomeController extends GetxController {
  Position? position;
  StreamSubscription? positionSuscribe;

  var indexBottomPage = 0.obs;
  var currentAddress = "".obs;
  LocalNotificationProvider localNotificationProvider =
      LocalNotificationProvider();
  CarsProvider carsProvider = CarsProvider();
  AccidentProvider accidentProvider = AccidentProvider();
  User? user = User.fromJson(GetStorage().read('user'));
  HomeController() {
    indexBottomPage.value = 0;
    print("Home Controller active");
    getUserCurrentLocation();
    checkGPS();
  }

  void checkGPS() async {
    await Future.delayed(Duration(milliseconds: 500));
/*
    for (int i = 0; i < gasStationList.length; i++) {
      BitmapDescriptor temp = await createMarkerFromAssets(Assets.GAS_STATION);
      await Future.delayed(Duration(milliseconds: 500));
      gasStations.add(temp);
    }*/

    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationEnabled) {
      updateLocation();
    } else {
      bool locationGPS = await location.Location().requestService();
      if (locationGPS) {
        updateLocation();
      }
    }
  }

  void updateLocation() async {
    try {
      await getUserCurrentLocation();
      position = await Geolocator.getLastKnownPosition();
      List<int> popUpList = [];

      LocationSettings locationSettings =
          LocationSettings(accuracy: LocationAccuracy.best, distanceFilter: 1);

      positionSuscribe =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen((Position pos) {
        position:
        pos;
        getAddressFromLatLng(pos);

        position = pos;
      });
    } catch (e) {
      print('Error: ${e}');
    }
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    Position position = await Geolocator.getCurrentPosition();
    getAddressFromLatLng(position);
    return position;
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
        Get.toNamed('/home/radio');
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

  void sendWhatsApp(BuildContext context, String message) async {
    ProgressDialog progressDialog = ProgressDialog(context: context);
    progressDialog.show(max: 100, msg: 'Creando enlace...');

    Position pos = await getUserCurrentLocation();
    await Future.delayed(Duration(milliseconds: 500));
    ResponseApi responseApi = await accidentProvider.create(
        user!.name!,
        user!.lastname!,
        user!.email!,
        user!.phone!,
        user!.cars![0].model == null ? '' : user!.cars![0].model!,
        pos.latitude,
        pos.longitude,
        user!.cars![0].number_plate == null
            ? ''
            : user!.cars![0].number_plate!);
    String mapsMessage =
        "https://maps.google.com/?q=${pos.latitude},${pos.longitude}";
    print("Lat: ${pos.latitude}, Lon: ${pos.longitude}");
    Uri uriMessage = Uri.parse(message);
    progressDialog.close();
    launchUrl(
        Uri.parse(
            '${Environment.EMERGENCY_CHAT}text=${uriMessage}\n${mapsMessage}'),
        mode: LaunchMode.inAppWebView);
    print("Abriendo Link");
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress.value = '${place.locality}, ${place.street} ';

      print("Place:  ${currentAddress.value}");
    }).catchError((e) {
      debugPrint(e);
    });
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

  void SendMessage() {
    localNotificationProvider.showLocalNotification('Prueba', 'Body prueba');
  }

  void goToBothPayment(BuildContext context) async {
    ResponseApi responseApi = await carsProvider.getCars(user!.id!);
    ProgressDialog progressDialog = ProgressDialog(context: context);

    progressDialog.show(max: 100, msg: 'Obteniendo Datos...');

    if (responseApi.success!) {
      progressDialog.close();

      //Iterable l = json.decode(responseApi.data.toString());
      //List<Car> cars = List<Car>.from(l.map((model) => Car.fromJson(model)));
      List<Car> cars = Car.fromJsonList(responseApi.data);
      user!.cars = cars;
      Map temp = user!.toJson();
      print('GET CAR:  ${user!.toJson()}');
      GetStorage().write('user', user!.toJson());
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
