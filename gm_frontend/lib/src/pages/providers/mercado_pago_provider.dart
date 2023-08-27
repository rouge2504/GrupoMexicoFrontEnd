import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/main.dart';
import 'package:gm_frontend/src/environment/environment.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_token.dart';
import 'package:gm_frontend/src/models/mercado_pago_document_type.dart';
import 'package:gm_frontend/src/models/mercado_pago_payment_method_installments.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';

class MercadoPagoProvider extends GetConnect {
  String url = Environment.API_MERCADO_PAGO;
  //User userSession = User.fromJson(GetStorage().read('user') ?? {});

  String? paymentMethodId;
  String? issuerIdSave;

  Future<List<MercadoPagoDocumentType>> getAll() async {
    Response response = await get('$url/identification_types', headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Environment.ACCESS_TOKEN}',
    }); //ESPERA HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    print("Esta es la respuesta: ${response.statusCode}");
    if (response.statusCode == 401) {
      Get.snackbar('Peticion denegada',
          'Tu usuario no tiene permitido leer esta informacion');
      return [];
    }

    List<MercadoPagoDocumentType> categories =
        MercadoPagoDocumentType.fromJsonList(response.body);
    return categories;
  }

  Future<MercadoPagoPaymentMethodInstallments> getInstallments(
      String bin, double amount) async {
    Response response =
        await get('$url/payment_methods/installments', headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Environment.ACCESS_TOKEN}',
    }, query: {
      'bin': bin,
      'amount': '${amount}',
    });

    print('RESPONSE: ${response}');
    print('RESPONSE STATUS CODE: ${response.statusCode}');
    print('RESPONSE Body: ${response.body}');
    if (response.statusCode == 401) {
      Get.snackbar('Petinicion Denegada',
          'Tu usuario no tiene permiso de ver esta infomracion');
      return MercadoPagoPaymentMethodInstallments();
    }

    if (response.statusCode != 200) {
      Get.snackbar(
          'Petinicion Denegada', 'No se pudo obtener las cuotas de la tarjeta');
      return MercadoPagoPaymentMethodInstallments();
    }

    MercadoPagoPaymentMethodInstallments data =
        MercadoPagoPaymentMethodInstallments.fromJson(response.body[0]);

    return data;
  }

  Future<ResponseApi> createPayment({
    @required String? token,
    @required String? paymentMethodId,
    @required String? paymentTypeId,
    @required String? emailCostumer,
    @required String? issuerId,
    @required String? identificationId,
    @required String? identificationNumber,
    @required double? transactionAmount,
    @required int? installments,
    @required int? quantity,
    @required double? unit_price,
  }) async {
    String url = '${Environment.API_URL}api/payment/create';
    print('URL: ${url}');
    Response response = await post(
      url,
      {
        'token': token,
        'issuer_id': issuerId,
        'payment_method_id': paymentMethodId,
        'transaction_amount': transactionAmount,
        'installments': installments,
        'description': 'A Example pay',
        'quantity': quantity,
        'unit_price': unit_price,
        'payer': {
          'email': emailCostumer,
          /*'identification': {
            'number': identificationNumber,
          },*/
        },
      },
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      },
    );
    print('Acces TOKEN:_ ${token}');
    print('REspuesta BODY: ${response.body}');
    print('REspuesta STATUS: ${response.statusCode}');
    if (response.body != null) {
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      return responseApi;
    } else {
      print('NO SALE ESTA BASURA');
    }
    return ResponseApi();
  }

  Future<MercadoPagoCardToken> createCardToken({
    String? cvv,
    String? expirationYear,
    int? expirationMonth,
    String? cardNumber,
    String? cardHolderName,
    String? documentNumber,
    String? documentId,
  }) async {
    Response response =
        await post('$url/card_tokens?public_key=${Environment.PUBLIC_KEY}', {
      'security_code': cvv,
      'expiration_year': expirationYear,
      'expiration_month': expirationMonth,
      'card_number': cardNumber,
      'card_holder': {
        'name': cardHolderName,
        'identification': {'number': documentNumber, 'type': documentId}
      },
    }, headers: {
      'Content-Type': 'application/json',
    }, query: {
      'public_key': Environment.PUBLIC_KEY
    });

    if (response.statusCode != 201) {
      Get.snackbar('Error', 'No se pudo validar la tarjeta');
      print('RESPONSE: ${response}');
      print('RESPONSE STATUS CODE: ${response.statusCode}');
      print('RESPONSE Body: ${response.body}');
      return MercadoPagoCardToken();
    }

    MercadoPagoCardToken res = MercadoPagoCardToken.fromJson(response.body);
    return res;
  }
}
