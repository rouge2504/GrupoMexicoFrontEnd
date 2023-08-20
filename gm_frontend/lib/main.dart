import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:gm_frontend/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:gm_frontend/src/pages/client/products/list/client_products_list_page.dart';
import 'package:gm_frontend/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:gm_frontend/src/pages/client/profile/update/client_profile_update_controller.dart';
import 'package:gm_frontend/src/pages/client/profile/update/client_profile_update_page.dart';
import 'package:gm_frontend/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:gm_frontend/src/pages/home/home_page.dart';
import 'package:gm_frontend/src/pages/login/login_page.dart';
import 'package:gm_frontend/src/pages/register/register_page.dart';
import 'package:gm_frontend/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:gm_frontend/src/pages/roles/roles_page.dart';

User userSession = User.fromJson(GetStorage().read('user') ?? {});
void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grupo Mexico',
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id != null
          ? userSession.roles!.length > 1
              ? '/roles'
              : '/client/products/list'
          : '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/roles', page: () => RolesPage()),
        GetPage(
            name: '/restaurant/orders/list',
            page: () => RestaurantOrdersListPage()),
        GetPage(
            name: '/client/products/list',
            page: () => ClientProductsListPage()),
        GetPage(
            name: '/delivery/orders/list',
            page: () => DeliveryOrdersListPage()),
        GetPage(
            name: '/client/profile/info', page: () => ClientProfileInfoPage()),
        GetPage(
            name: '/client/profile/update',
            page: () => ClientProfileUpdatePage()),
      ],
      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.amber,
              onPrimary: Colors.grey,
              secondary: Colors.amberAccent,
              onSecondary: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey,
              background: Colors.grey,
              onBackground: Colors.grey,
              surface: Colors.grey,
              onSurface: Colors.grey)),
      navigatorKey: Get.key,
    );
  }
}
