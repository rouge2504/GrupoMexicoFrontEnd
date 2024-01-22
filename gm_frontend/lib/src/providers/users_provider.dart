import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_reference.dart';
import 'package:gm_frontend/src/providers/cars_provider.dart';
import 'package:path/path.dart';
import 'package:gm_frontend/src/environment/environment.dart';
import 'package:gm_frontend/src/models/response_api.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends GetConnect {
  String url = Environment.API_URL + 'api/users';
  Future<Response> create(User user) async {
    print('$url/create');
    print(user.toJson());
    Response response = await post('$url/create', user.toJson(),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('A network error occurred');
    }
    print(response.request);
    print(response.statusText);
    return response;
  }

  /*Future<ResponseApi> createCard(MercadoPagoCardReference mercadoPagoCardReference) async{
    String url = '${Environment.API_URL}api/users/create';
    Response response = await post(url, {
      'email': email,
      'password': password,
    }, headers: {
      'Content-Type': 'application/json'
    });
  }*/

  Future<ResponseApi> createUser(User user) async {
    String url = '${Environment.API_URL}api/users/create';
    String json = user.toJson().toString();
    Response response = await post(url, user.toJson(),
        headers: {'Content-Type': 'application/json'});
    print(response.status);
    if (response.body == null) {
      print("Todo se fue a la chingada");
      return ResponseApi();
    } else {
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      print('Response Api data: ${responseApi.data}');
      print('Response Api success: ${responseApi.success}');
      return responseApi;
    }

    return ResponseApi();
  }

  Future<ResponseApi> update(User user) async {
    Response response = await put('$url/updateWithoutImage', user.toJson(),
        headers: {'Content-Type': 'application/json'});

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo actualizar la informacion');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }

  Future<Stream> createWithImage(User user, File image) async {
    Uri uri = Uri.http(Environment.API_URL_OLD, '/api/users/createWithImage');
    final request = http.MultipartRequest('POST', uri);
    request.files.add(http.MultipartFile(
        'image', http.ByteStream(image.openRead().cast()), await image.length(),
        filename: basename(image.path)));
    request.fields['user'] = json.encode(user);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }

  Future<Stream> updateWithImage(User user, File image) async {
    Uri uri = Uri.http(Environment.API_URL_OLD, '/api/users/update');
    final request = http.MultipartRequest('PUT', uri);
    request.files.add(http.MultipartFile(
        'image', http.ByteStream(image.openRead().cast()), await image.length(),
        filename: basename(image.path)));
    request.fields['user'] = json.encode(user);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }

  /*
  * GET X
   */
  Future<ResponseApi> createUserWithImageGetX(User user, File image) async {
    FormData form = FormData({
      'image': MultipartFile(image, filename: basename(image.path)),
      'user': json.encode(user)
    });
    Response response = await post('$url/createWithImage', form);

    if (response.body == null) {
      Get.snackbar('Error en la peticion', 'No se pudo crear el usuario');
      return ResponseApi();
    }
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post('$url/login', {
      'email': email,
      'password': password,
    }, headers: {
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 201) {
      print('Se logro hacer login');
      print(response.body);
    } else {
      print('A network error occurred');
    }

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }
}
