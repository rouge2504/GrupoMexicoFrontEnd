import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_token.dart';
import 'package:gm_frontend/src/models/mercado_pago_installment.dart';
import 'package:gm_frontend/src/models/mercado_pago_payment_method_installments.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:gm_frontend/src/pages/providers/mercado_pago_provider.dart';

class ClientPaymentsIntallmentsController extends GetxController {
  var total = 0.0.obs;
  var installments = 1.obs;
  List<MercadoPagoInstallment> installmentList = <MercadoPagoInstallment>[].obs;
  MercadoPagoPaymentMethodInstallments? paymentMethodInstallments;
  MercadoPagoProvider mercadoPagoProvider = MercadoPagoProvider();
  User user = User.fromJson(GetStorage().read('user') ?? {});

  MercadoPagoCardToken cardToken =
      MercadoPagoCardToken.fromJson(Get.arguments['card_token']);

  ClientPaymentsIntallmentsController() {
    getTotal();
    getInstallments();
  }

  void createPayment() async {
    ResponseApi responseApi = await mercadoPagoProvider.createPayment(
      token: cardToken.id,
      paymentMethodId: paymentMethodInstallments!.paymentMethodId,
      paymentTypeId: paymentMethodInstallments!.paymentMethodId,
      issuerId: paymentMethodInstallments!.issuer!.id,
      transactionAmount: total.value,
      installments: 1,
      emailCostumer: user.email,
      identificationNumber: '525252',
    );

    Fluttertoast.showToast(
        msg: responseApi.message ?? '', toastLength: Toast.LENGTH_LONG);

    if (responseApi.success == true) {
      print('TODO SALIO DE HUEVOS!!!!');
    }
  }

  void getInstallments() async {
    if (cardToken.firstSixDigits != null) {
      var result = await mercadoPagoProvider.getInstallments(
          cardToken.firstSixDigits!, total.value);
      paymentMethodInstallments = result;
      print('RESULT: ${result}');

      if (installmentList != null) {
        installmentList.clear();
        installmentList.addAll(result.payerCosts!);
      }
    }
  }

  void getTotal() {
    total.value = 200.00;
  }
}
