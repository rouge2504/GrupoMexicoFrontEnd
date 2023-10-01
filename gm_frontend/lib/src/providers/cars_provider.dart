import 'package:get/get.dart';
import 'package:gm_frontend/src/environment/environment.dart';
import 'package:gm_frontend/src/models/Car.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:get_storage/get_storage.dart';

class CarsProvider extends GetConnect {
  String url = Environment.API_URL + 'api/car';

  Future<ResponseApi> createCar(Car car) async {
    String url = '${Environment.API_URL}api/car/createCar';
    User user = User.fromJson(GetStorage().read('user') ?? {});
    ;
    print('Car JSON ${car.toJson()}');
    Response response = await post(url, car.toJson(),
        headers: {'Content-Type': 'application/json'});
    print(response.status);
    if (response.body == null) {
      print("Todo se fue a la chingada con el carro");
      return ResponseApi();
    } else {
      print('Response Body Car: ${response.body}');
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      print('Response Api data: ${responseApi.data}');
      print('Response Api success: ${responseApi.success}');
      if (!responseApi.success!) {
        return ResponseApi();
      }
      Car? carTemp = Car.fromJson(responseApi.data);
      print('Carro Alias: ${carTemp.alias}');
      print('User Id: ${user.id}');
      if (user.cars == null) {
        user.cars = [];
        user.cars?.add(carTemp);
        print('Add to list: ${user.cars}');
        GetStorage().write('user', user);
      } else {
        user.cars?.add(carTemp);
        GetStorage().write('user', user);
      }

      return responseApi;
    }

    return ResponseApi();
  }

  Future<ResponseApi> getCars(String? id) async {
    String url = '${Environment.API_URL}api/car/getCars';
    Response response = await post(url, {
      'id_user': id,
    }, headers: {
      'Content-Type': 'application/json'
    });

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }
}
