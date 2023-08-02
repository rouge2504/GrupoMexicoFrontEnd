import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/pages/login/login_page.dart';
import 'package:gm_frontend/src/pages/register/register_page.dart';

void main() {
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
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
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
