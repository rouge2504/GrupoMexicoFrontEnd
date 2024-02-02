import 'package:get/get.dart';
import 'package:gm_frontend/src/environment/environment.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_reference.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_token.dart';
import 'package:gm_frontend/src/models/mercado_pago_oauth.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:get_storage/get_storage.dart';

class CardProvider extends GetConnect {
  String url = Environment.API_URL + 'api/car';

  Future<ResponseApi> createCard(
      MercadoPagoCardReference mercadoPagoCardReference,
      String cardNumber,
      String cvv) async {
    String url = '${Environment.API_URL}api/card/createCard';
    User user = User.fromJson(GetStorage().read('user') ?? {});

    Response response = await post(url, {
      "id_user": user.id,
      "id_card": mercadoPagoCardReference.id,
      "number_card": cardNumber,
      "nip": cvv
    }, headers: {
      'Content-Type': 'application/json'
    });

    if (response.body == null) {
      print("Todo se fue a la chingada con el carro Card Provider");
      return ResponseApi();
    }
    print('Response Body Card: ${response.body}');
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    print('Response Api Card data: ${responseApi.data}');
    print('Response Api  Card success: ${responseApi.success}');
    return responseApi;
  }
}
