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
        top: MediaQuery.of(context).size.height * 0.70,
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [_buttonRegister(context), _buttonLogin(), _forgotAccount()],
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'Iniciar Sesión',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }

  Widget _forgotAccount() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'Olvide mi contraseña',
            style: TextStyle(color: Colors.black, fontSize: 20),
          )),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              side: BorderSide(
                  width: 1.0, color: Theme.of(context).colorScheme.primary),
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'Registrarse',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 20),
          )),
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
