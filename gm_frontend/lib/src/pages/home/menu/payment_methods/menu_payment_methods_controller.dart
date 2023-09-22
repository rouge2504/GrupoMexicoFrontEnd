import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/models/CardModel.dart';
import 'package:gm_frontend/src/models/costumerMercadoPago.dart';

import 'package:gm_frontend/src/models/mercado_pago_card_holder.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_token.dart';
import 'package:gm_frontend/src/models/mercado_pago_document_type.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:gm_frontend/src/pages/providers/mercado_pago_provider.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:get_storage/get_storage.dart';

class MenuPaymentMethodsController extends GetxController {
  PageController pageController = PageController();
  var validForm = false.obs;
  List<CardModel> cardsModel = <CardModel>[].obs;
  GlobalKey<FormState> formKey = GlobalKey();
  MercadoPagoProvider mercadoPagoProvider = MercadoPagoProvider();
  User userSession = User.fromJson(GetStorage().read('user') ?? {});
  CostumerMercadoPago? costumerMercadoPago;

  MenuPaymentMethodsController() {
    CheckClient();
  }

  void CheckClient() async {
    print("Buscando cliente");
    costumerMercadoPago =
        await mercadoPagoProvider.findClient(userSession.email!);

    print(costumerMercadoPago!.results![0].id);

    if (costumerMercadoPago!.results!.isEmpty) {
      print("Cliente no encontrado");
      ResponseApi responseApi = await mercadoPagoProvider.createClient(
          email: userSession.email,
          first_name: userSession.name,
          last_name: userSession.lastname,
          area_code: '1',
          number: userSession.phone);
      if (responseApi.success!) {
        print("Cliente Creado");
      }
    }
  }

  var cardNumber = ''.obs;
  var expireDate = ''.obs;
  var cardHolderName = ''.obs;
  var cvvCode = ''.obs;
  var isCvvFocused = false.obs;
  void onCreditCardModelChanged(CreditCardModel creditCardModel) {
    cardNumber.value = creditCardModel.cardNumber;
    expireDate.value = creditCardModel.expiryDate;
    cardHolderName.value = creditCardModel.cardHolderName;
    isCvvFocused.value = creditCardModel.isCvvFocused;
    cvvCode.value = creditCardModel.cvvCode;
  }

  void register(BuildContext context) async {}
}
