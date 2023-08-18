import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/src/models/user.dart';

import '../../models/Rol.dart';

class RolesController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});

  void goToPageRol(Rol rol) {
    Get.offNamedUntil(rol.route ?? '', (route) => false);
  }
}
