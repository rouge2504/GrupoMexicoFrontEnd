import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      initialRoute: '/qr',
      getPages: [
        GetPage(
            name: '/payments/create', page: () => ClientPaymentsCreatePage()),
        GetPage(
            name: '/payments/installments',
            page: () => ClientPaymentsIntallmentsPage()),
        GetPage(name: '/qr', page: () => QRPage()),
      ],
      navigatorKey: Get.key,
    );
  }
}
