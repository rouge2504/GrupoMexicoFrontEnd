import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:gm_frontend/src/pages/home/both_payment/both_payment_page.dart';
import 'package:gm_frontend/src/pages/home/home_page.dart';
import 'package:gm_frontend/src/pages/home/media/resources_media_page.dart';
import 'package:gm_frontend/src/pages/home/menu/account/menu_account_page.dart';
import 'package:gm_frontend/src/pages/home/menu/car/menu_car_page.dart';
import 'package:gm_frontend/src/pages/home/menu/notification/menu_notification_page.dart';
import 'package:gm_frontend/src/pages/home/routes/home_routes_page.dart';
import 'package:gm_frontend/src/pages/home/routes/recent_payments/home_routes_recent_payments_page.dart';
import 'package:gm_frontend/src/pages/login/login_page.dart';
import 'package:gm_frontend/src/pages/home/menu/menu_page.dart';
import 'package:gm_frontend/src/pages/on_boarding/on_boarding_page.dart';
import 'package:gm_frontend/src/pages/payments/create/client/create_client_page.dart';
import 'package:gm_frontend/src/pages/payments/create/client_payments_create_page.dart';
import 'package:gm_frontend/src/pages/payments/installments/client_payments_installments.controller.dart';
import 'package:gm_frontend/src/pages/payments/installments/client_payments_installments_page.dart';
import 'package:gm_frontend/src/pages/payments/paid/payments_paid_page.dart';
import 'package:gm_frontend/src/pages/qr/qr_generator/qr_page.dart';
import 'package:gm_frontend/src/pages/qr/qr_reader/qr_reader_page.dart';
import 'package:gm_frontend/src/pages/register/register_page.dart';
import 'package:gm_frontend/src/pages/register_car/register_car_page.dart';
import 'package:gm_frontend/src/pages/splash/splash_page.dart';
import 'package:get_storage/get_storage.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grupo Mexico',
      initialRoute: '/home/menu/car',
      //initialRoute: '/home/menu/account',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/splash', page: () => SplashPage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/register_car', page: () => RegisterCarPage()),
        GetPage(name: '/on_boarding', page: () => OnBoardingPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/home/both_payment', page: () => BothPaymentPage()),
        GetPage(name: '/home/routes', page: () => HomeRoutesPage()),
        GetPage(name: '/home/media', page: () => ResourcesMediaPage()),
        GetPage(
            name: '/home/routes/recent_payments',
            page: () => HomeRoutesRecentPaymentsPage()),
        GetPage(name: '/home/menu', page: () => MenuPage()),
        GetPage(name: '/home/menu/account', page: () => MenuAccountPage()),
        GetPage(name: '/home/menu/car', page: () => MenuCarPage()),
        GetPage(
            name: '/home/menu/notification',
            page: () => MenuNotificationPage()),
        GetPage(
            name: '/payments/create', page: () => ClientPaymentsCreatePage()),
        GetPage(
            name: '/payments/create/client', page: () => CreateClientPage()),
        GetPage(
            name: '/payments/installments',
            page: () => ClientPaymentsIntallmentsPage()),
        GetPage(name: '/payments/paid', page: () => PaymentPaidPage()),
        GetPage(name: '/qr/qr_generator', page: () => QRGeneratorPage()),
        GetPage(name: '/qr/qr_reader', page: () => QRReaderPage()),
      ],
      theme: ThemeData(
        primaryColor: Color.fromRGBO(210, 39, 48, 1),
        fontFamily: 'Raleway',
        scaffoldBackgroundColor: Color.fromRGBO(245, 245, 245, 1),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromRGBO(210, 39, 48, 1),
          onPrimary: Colors.white,
          secondary: const Color.fromRGBO(45, 140, 158, 1),
          onSecondary: Colors.grey,
          error: Colors.grey,
          onError: Colors.grey,
          background: const Color.fromRGBO(225, 224, 223, 1),
          onBackground: Colors.grey,
          surface: Color.fromRGBO(84, 88, 89, 1),
          onSurface: Color.fromRGBO(225, 94, 99, 1),
        ),
      ),
      navigatorKey: Get.key,
    );
  }
}
