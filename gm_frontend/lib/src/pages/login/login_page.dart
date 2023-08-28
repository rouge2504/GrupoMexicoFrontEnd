import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/pages/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginController con = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: _textDontHaveAccount(),
      ),
      body: Stack(
        children: [
          _boxForm(context),
        ],
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.1,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.55,
        left: 50,
        right: 50,
      ),
      child: Column(
        children: [_buttonRegister(), _buttonLogin()],
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'LOGIN',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'Registrarse',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        SizedBox(width: 7),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Regristrate aqui',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        )
      ],
    );
  }

  Widget _imageCover() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 15),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/img/delivery.png',
          width: 130,
          height: 130,
        ),
      ),
    );
  }
}
