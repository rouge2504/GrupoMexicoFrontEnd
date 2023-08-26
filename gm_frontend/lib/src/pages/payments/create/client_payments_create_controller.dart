import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_holder.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_token.dart';
import 'package:gm_frontend/src/models/mercado_pago_document_type.dart';
import 'package:gm_frontend/src/pages/providers/mercado_pago_provider.dart';

class ClientPlaymentsCreateController extends GetxController {
  TextEditingController documentNumberController = TextEditingController();
  var cardNumber = ''.obs;
  var expireDate = ''.obs;
  var cardHolderName = ''.obs;
  var cvvCode = ''.obs;
  var isCvvFocused = true.obs;

  GlobalKey<FormState> formKey = GlobalKey();
  MercadoPagoProvider mercadoPagoProvider = MercadoPagoProvider();
  List<MercadoPagoDocumentType> documents = <MercadoPagoDocumentType>[].obs;

  void createCardToken() async {
    String documentNumber = documentNumberController.text;
    print('Cvv code: ${cvvCode.value}');

    if (isValidForm(documentNumber)) {
      cardNumber.value = cardNumber.value.replaceAll(RegExp(' '), '');
      List<String> list = expireDate.split('/');
      int month = int.parse(list[0]);
      String year = '20${list[1]}';
      MercadoPagoCardToken mercadoPagoCardToken =
          await mercadoPagoProvider.createCardToken(
              cardNumber: cardNumber.value,
              expirationYear: year,
              expirationMonth: month,
              cardHolderName: cardHolderName.value,
              cvv: cvvCode.value,
              documentId: 'C.C.',
              documentNumber: '5151515151');
      Get.toNamed('/client/payments/installments', arguments: {
        'card_token': mercadoPagoCardToken.toJson(),
      });
      print('Mercado Pago ${mercadoPagoCardToken.toJson()}');
    }
  }

  bool isValidForm(String documentNumber) {
    if (cardNumber.value.isEmpty) {
      Get.snackbar('Formulario No valido', 'Ingresa el numero de la tarjeta');
      return false;
    }

    if (expireDate.value.isEmpty) {
      Get.snackbar('Formulario No valido', 'Ingresa la fecha de vencimiento');
      return false;
    }

    if (cardHolderName.value.isEmpty) {
      Get.snackbar('Formulario No valido', 'Ingresa el nombre del titular');
      return false;
    }

    if (cvvCode.value.isEmpty) {
      Get.snackbar('Formulario No valido', 'Ingresa el codigo de seguridad');
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
