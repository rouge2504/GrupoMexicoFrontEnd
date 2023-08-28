import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/pages/login/login_page.dart';
import 'package:gm_frontend/src/pages/payments/create/client_payments_create_page.dart';
import 'package:gm_frontend/src/pages/payments/installments/client_payments_installments.controller.dart';
import 'package:gm_frontend/src/pages/payments/installments/client_payments_installments_page.dart';
import 'package:gm_frontend/src/pages/qr/qr_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grupo Mexico',
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(
            name: '/payments/create', page: () => ClientPaymentsCreatePage()),
        GetPage(
            name: '/payments/installments',
            page: () => ClientPaymentsIntallmentsPage()),
        GetPage(name: '/qr', page: () => QRPage()),
      ],
      theme: ThemeData(
          primaryColor: Color.fromRGBO(210, 39, 48, 1),
          fontFamily: 'Raleway',
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Color.fromRGBO(210, 39, 48, 1),
              onPrimary: Colors.grey,
              secondary: const Color.fromRGBO(45, 140, 158, 1),
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
