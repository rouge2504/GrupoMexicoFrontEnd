import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:gm_frontend/src/models/user.dart';
import 'package:gm_frontend/src/pages/home/home_page.dart';
import 'dart:async';

import 'package:gm_frontend/src/pages/login/login_page.dart';
import 'package:gm_frontend/src/pages/on_boarding/on_boarding_page.dart';
import 'package:gm_frontend/src/pages/register/register_page.dart';
import 'package:gm_frontend/src/utils/preferences_app.dart';
import 'package:get_storage/get_storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();

    User userSession = User.fromJson(GetStorage().read('user') ?? {});
    print(userSession.id);
    var onBoardingActive =
        GetStorage().read(PreferenceApp.ON_BOARDING_ACTIVE) ?? false;
    print('Splahs Onboarding: ${onBoardingActive}');
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => onBoardingActive
                    ? userSession.id != null
                        ? HomePage()
                        : LoginPage()
                    : OnBoardingPage())));
  }

  void init() async {
    await GetStorage.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _backgroundCover(),
        _imageLogo(),
      ],
    ));
  }

  Widget _backgroundCover() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.BACKGROUND_IMAGE),
          fit: BoxFit.cover,
        ),
      ),
      child: null /* add child content here */,
    );
  }

  Widget _imageLogo() {
    return Center(
        child: Image(
      image: AssetImage(Assets.LOGO),
      width: 300,
    ));
  }
}
