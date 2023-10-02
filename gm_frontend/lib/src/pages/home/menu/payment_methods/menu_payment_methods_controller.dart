import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/models/CardModel.dart';
import 'package:gm_frontend/src/models/costumerMercadoPago.dart';

import 'package:gm_frontend/src/models/mercado_pago_card_holder.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_reference.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_token.dart';
import 'package:gm_frontend/src/models/mercado_pago_credit_cart.dart';
import 'package:gm_frontend/src/models/mercado_pago_customer.dart';
import 'package:gm_frontend/src/models/mercado_pago_document_type.dart';
import 'package:gm_frontend/src/models/mercado_pago_oauth.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:gm_frontend/src/pages/providers/mercado_pago_provider.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:get_storage/get_storage.dart';

import 'package:sn_progress_dialog/progress_dialog.dart';

class MenuPaymentMethodsController extends GetxController {
  PageController pageController = PageController();
  var validForm = false.obs;
  List<CardModel> cardsModel = <CardModel>[].obs;
  GlobalKey<FormState> formKey = GlobalKey();
  MercadoPagoProvider mercadoPagoProvider = MercadoPagoProvider();
  User userSession = User.fromJson(GetStorage().read('user') ?? {});
  MercadoPagoCustomer? costumerMercadoPago;

  String? idCostumer;

  List<MercadoPagoCardReference> creditCards = <MercadoPagoCardReference>[].obs;

  var cardLength = 0.obs;

  MenuPaymentMethodsController() {
    CheckClient();
    // GetToken();
  }

  /* void GetToken() async {
    MercadoPagoOauth mercadoPagoOauth = await mercadoPagoProvider.getToken();
  }*/

  void CheckClient() async {
    print("Buscando cliente");
    CostumerMercadoPago tempCustomer =
        await mercadoPagoProvider.findClientWithResult(userSession.email!);

    //print('Lenght Tarjetas: ${costumerMercadoPago!.results!.length}');

    if (tempCustomer!.results![0].id == null) {
      print("Cliente no encontrado");
      ResponseApi responseApi = await mercadoPagoProvider.createClient(
          email: userSession.email,
          first_name: userSession.name,
          last_name: userSession.lastname,
          area_code: '1',
          number: userSession.phone);
      if (responseApi.success!) {
        print("Cliente Creado");
        costumerMercadoPago = MercadoPagoCustomer.fromJson(responseApi.data);
        idCostumer = costumerMercadoPago!.id;
        creditCards =
            await mercadoPagoProvider.getCards(costumerMercadoPago!.id!);
        print('Credit cards ${creditCards.length}');
        //progressDialog.close();

        return;
      }
    } else {
      idCostumer = tempCustomer!.results![0].id;
      await Future.delayed(Duration(milliseconds: 1500));
      creditCards = await mercadoPagoProvider.getCards(idCostumer!);
      print('Credit cards ${creditCards.length}');
      cardLength.value = creditCards.length;
      //progressDialog.close();

      print("El cliente ya existe");
      return;
    }

    if (!creditCards.isEmpty) {
      print('Credit cards ${creditCards.length}');
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

  void register(BuildContext context) async {
    cardNumber.value = cardNumber.value.replaceAll(RegExp(' '), '');
    List<String> list = expireDate.split('/');
    int month = int.parse(list[0]);
    String year = '20${list[1]}';
    MercadoPagoCardToken mercadoPagoCardToken =
        await mercadoPagoProvider.createCardTokenWithID(
            cardNumber: cardNumber.value,
            expirationYear: year,
            expirationMonth: month,
            cardHolderName: cardHolderName.value,
            cvv: cvvCode.value,
            documentId: 'C.C.',
            documentNumber: '5151515151',
            idToken: idCostumer);
  }
}
