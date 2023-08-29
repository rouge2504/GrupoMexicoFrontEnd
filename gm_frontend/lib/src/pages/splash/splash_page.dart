import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'dart:async';

import 'package:gm_frontend/src/pages/login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
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
