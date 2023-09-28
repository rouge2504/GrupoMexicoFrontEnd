import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/src/models/Car.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:gm_frontend/src/providers/cars_provider.dart';
import 'package:gm_frontend/src/providers/users_provider.dart';
import 'package:gm_frontend/src/utils/preferences_app.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_holder.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_token.dart';
import 'package:gm_frontend/src/models/mercado_pago_document_type.dart';
import 'package:gm_frontend/src/pages/providers/mercado_pago_provider.dart';

class RegisterCarController extends GetxController {
  TextEditingController aliasController = TextEditingController();
  TextEditingController numberPlateController = TextEditingController();
  TextEditingController markController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController edgeController = TextEditingController();

  PageController pageController = PageController();

  CarsProvider carsProvider = CarsProvider();
  GlobalKey<FormState> formKey = GlobalKey();

  var email = ''.obs;
  var name = ''.obs;
  var lastName = ''.obs;
  var phone = ''.obs;

  var validForm = false.obs;
  var validFormPassword = true.obs;

  var activePage = 0.obs;

  var passwordVisible = false.obs;
  var passwordConfirmVisible = false.obs;

  MercadoPagoProvider mercadoPagoProvider = MercadoPagoProvider();
  String? idCostumer;

  TextEditingController documentNumberController = TextEditingController();
  var cardNumber = ''.obs;
  var expireDate = ''.obs;
  var cardHolderName = ''.obs;
  var cvvCode = ''.obs;
  var isCvvFocused = true.obs;

  ImagePicker picker = ImagePicker();
  File? imageFile;

  User user = User.fromJson(GetStorage().read('user')) ?? User();

  RegisterCarController() {
    print(user.id);

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

  void init() async {
    await GetStorage.init();
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

  void nextButton(BuildContext context) {
    activePage.value++;
    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
    print('NEXT BUTTON ${activePage.value}');
    registerCar(context);
  }

  void registerCard(BuildContext context) async {
    cardNumber.value = cardNumber.value.replaceAll(RegExp(' '), '');
    List<String> list = expireDate.split('/');
    int month = int.parse(list[0]);
    String year = '20${list[1]}';
    ProgressDialog progressDialog = ProgressDialog(context: context);
    progressDialog.show(max: 100, msg: 'Registrando Datos de la tarjeta...');
    ResponseApi responseApi =
        await mercadoPagoProvider.createCardTokenWithNewID(
            cardNumber: cardNumber.value,
            expirationYear: year,
            expirationMonth: month,
            cardHolderName: cardHolderName.value,
            cvv: cvvCode.value,
            documentId: 'C.C.',
            documentNumber: '5151515151',
            userSession: user);

    if (responseApi != null) {
      if (responseApi.success!) {
        progressDialog.close();
        //GetStorage().write('car', car);
        Get.snackbar('Registro Exitoso', responseApi.message ?? '');
        GetStorage().write(PreferenceApp.POP_UP_HOME, true);
        //goToHomePage();
      } else {
        progressDialog.close();
        Get.snackbar('Algo salio mal', '');
      }
    }
  }

  void registerCar(BuildContext context) async {
    String alias = aliasController.text.trim();
    String numberPlate = numberPlateController.text.trim();
    String mark = markController.text.trim();
    String model = modelController.text.trim();
    String year = yearController.text.trim();
    String edges = edgeController.text.trim();

    Car car = Car(
        id: user.id,
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
        print('RESPONSE API REGISTER CAR: ${responseApi.data}');
        if (responseApi.success!) {
          progressDialog.close();
          car.id = responseApi.data.toString();
          //GetStorage().write('car', car);
          Get.snackbar('Registro Exitoso', responseApi.message ?? '');
          //goToHomePage();
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

  void onCreditCardModelChanged(CreditCardModel creditCardModel) {
    cardNumber.value = creditCardModel.cardNumber;
    expireDate.value = creditCardModel.expiryDate;
    cardHolderName.value = creditCardModel.cardHolderName;
    isCvvFocused.value = creditCardModel.isCvvFocused;
    cvvCode.value = creditCardModel.cvvCode;
  }
}
