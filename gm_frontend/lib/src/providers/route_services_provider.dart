import 'package:get/get.dart';
import 'package:gm_frontend/src/environment/environment.dart';
import 'package:gm_frontend/src/models/response_api.dart';

class RouteServicesProvider extends GetConnect {
  String url = Environment.API_URL + 'api/roadServices';

  Future<ResponseApi> getToolboths(int id_services) async {
    String _url = '${url}/getTollboths';
    Response response = await post(_url, {
      'id_services': id_services,
    }, headers: {
      'Content-Type': 'application/json'
    });
    if (response.body == null) {
      print("Todo se fue a la chingada con el carro GetToolBoths");
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
