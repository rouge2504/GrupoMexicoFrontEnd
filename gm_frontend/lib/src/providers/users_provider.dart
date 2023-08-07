import 'package:get/get.dart';
import 'package:gm_frontend/src/environment/environment.dart';
import 'package:gm_frontend/src/models/user.dart';

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
}
