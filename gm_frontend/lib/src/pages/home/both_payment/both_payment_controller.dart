import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/src/models/Car.dart';
import 'package:gm_frontend/src/models/QrMolding.dart';
import 'package:gm_frontend/src/models/costumerMercadoPago.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_reference.dart';
import 'package:gm_frontend/src/models/mercado_pago_customer.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:gm_frontend/src/pages/providers/mercado_pago_provider.dart';

class BothPaymentController extends GetxController {
  PageController pageController = PageController();
  var activePage = 0.obs;
  var validForm = false.obs;
  User user = User.fromJson(GetStorage().read('user') ?? {});
  List<Car> cars = <Car>[].obs;

  var carAlias = "".obs;
  var carEdges = "".obs;

  MercadoPagoProvider mercadoPagoProvider = MercadoPagoProvider();

  User userSession = User.fromJson(GetStorage().read('user') ?? {});
  MercadoPagoCustomer? costumerMercadoPago;

  String? idCostumer;

  List<MercadoPagoCardReference> creditCards = <MercadoPagoCardReference>[].obs;

  var cardLength = 0.obs;

  var payQR = "".obs;

  BothPaymentController() {
    for (var i = 0; i < user.cars!.length; i++) {
      cars.add(user.cars![i]);
    }

    CheckClient();
  }

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

  void onPageViewChange(int page) {
    print(page);
    activePage.value = page;
  }

  void nextPagePay(BuildContext context) async {
    activePage.value++;
    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);

    MercadoPagoCustomer costumerMercadoPago =
        await mercadoPagoProvider.findClient(user.email!);
  }

  void nextButton(BuildContext context) {
    activePage.value++;
    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
    print('NEXT BUTTON ${activePage.value}');
  }

  void PayButton() {
    QrMolding qrModel = QrMolding(
        nameUser: user.name,
        token: idCostumer,
        paymentMethodId: idCostumer,
        paymentTypeId: "",
        issuerId: "dfsdfsfsdfsfsdf",
        transactionAmount: 180,
        installments: 1,
        quantity: 1,
        unitPrice: 1,
        emailCostumer: user.name);

    payQR.value = qrModel.toJson().toString();
  }
}
