import 'package:get/get.dart';
import 'package:gm_frontend/src/environment/environment.dart';
import 'package:gm_frontend/src/models/response_api.dart';

class AccidentProvider extends GetConnect {
  String url = Environment.API_URL + 'api/accident';
  Future<ResponseApi> create(
      String? name,
      String? lastName,
      String? email,
      String? phone,
      String? carModel,
      double? lat,
      double? lon,
      String? numberPlate) async {
    String _url = '${url}/create';
    Response? response = await post(_url, {
      "nombre": name,
      "apellido": lastName,
      "email": email,
      "telefono": phone,
      "coche": carModel,
      "latitud": lat,
      "longuitud": lon,
      "placa": numberPlate
    }, headers: {
      'Content-Type': 'application/json'
    });

    if (response.body == null) {
      print("Todo se fue a la chingada con el carro Accident Provider");
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    if (responseApi.success!) {
      print("Todo salio bien");
      return responseApi;
    }
    return ResponseApi();
  }
}
