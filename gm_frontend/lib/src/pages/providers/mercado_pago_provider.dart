import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/main.dart';
import 'package:gm_frontend/src/environment/environment.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_token.dart';
import 'package:gm_frontend/src/models/mercado_pago_document_type.dart';
import 'package:gm_frontend/src/models/response_api.dart';

class MercadoPagoProvider extends GetConnect {
  String url = Environment.API_MERCADO_PAGO;

  Future<List<MercadoPagoDocumentType>> getAll() async {
    Response response = await get('$url/identification_types', headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Environment.ACCESS_TOKEN}',
    }); //ESPERA HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.statusCode == 401) {
      Get.snackbar('Peticion denegada',
          'Tu usuario no tiene permitido leer esta informacion');
      return [];
    }

    List<MercadoPagoDocumentType> categories =
        MercadoPagoDocumentType.fromJsonList(response.body);
    return categories;
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
