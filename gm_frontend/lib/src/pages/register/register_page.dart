import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gm_frontend/src/pages/register/register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterController con = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: _buttonBack(context),
        title: Text('Registra tus datos',
            style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: con.pageController,
        children: [
          _pageForm1(context),
          _pageForm2(context),
        ],
      ),
    );
  }

  Widget _pageForm1(BuildContext context) {
    return Column(
      children: [
        _boxForm(context),
        _buttonNext(context),
      ],
    );
  }

  Widget _pageForm2(BuildContext context) {
    return Column(
      children: [
        _boxFormPasword(context),
        _buttonRegister(context),
      ],
    );
  }

  Widget _buttonBack(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.only(left: 20),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.surface,
          size: 30,
        ),
      ),
    ));
  }

  Widget _boxFormPasword(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(1.0),
      //padding: EdgeInsets.fromLTRB(0, 0, 0, 210),
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black54,
          blurRadius: 15,
          offset: Offset(0, 0.50),
        )
      ]),
      child: Column(
        children: [
          _TitlePassword(),
          _textFielPassword(context),
          _textFielPasswordConfirm(context),
          //_buttonRegister(context)
        ],
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(1.0),
      //padding: EdgeInsets.fromLTRB(0, 0, 0, 210),
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black54,
          blurRadius: 15,
          offset: Offset(0, 0.50),
        )
      ]),
      child: Column(
        children: [
          _Title(),
          _textFieldName(context),
          _textFieldEmail(context),
          _textFieldPhone(context), _WAAdvertising(),

          //_buttonRegister(context)
        ],
      ),
    );
  }

  Widget _TitlePassword() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        alignment: Alignment.centerLeft,
        child: Text(
          'Crea tu contraseña',
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold),
        ));
  }

  Widget _Title() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        alignment: Alignment.centerLeft,
        child: Text(
          'Datos personales',
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold),
        ));
  }

  Widget _WAAdvertising() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.centerLeft,
        child: Text(
          'Este número debe tener Whatsapp en caso de emergencia´',
          style: TextStyle(
            fontSize: 12.0,
          ),
        ));
  }

  Widget _textFieldEmail(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        border: new Border.all(
          color: Theme.of(context).colorScheme.surface,
          width: 1.0,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: con.emailController,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Correo electronico',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _textFieldName(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        border: new Border.all(
          color: Theme.of(context).colorScheme.surface,
          width: 1.0,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: con.nameController,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Nombre y apellido',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _textFielPassword(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        border: new Border.all(
          color: Theme.of(context).colorScheme.surface,
          width: 1.0,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: con.passwordController,
          keyboardType: TextInputType.text,
          obscureText: true,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
              hintText: 'Contraseña',
              border: InputBorder.none,
              suffix: Icon(Icons.visibility_off_outlined)),
        ),
      ),
    );
  }

  Widget _textFielPasswordConfirm(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        border: new Border.all(
          color: Theme.of(context).colorScheme.surface,
          width: 1.0,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: con.passwordConfirmController,
          keyboardType: TextInputType.text,
          obscureText: true,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
              hintText: 'Confirmar contraseña',
              border: InputBorder.none,
              suffix: Icon(Icons.visibility_off_outlined)),
        ),
      ),
    );
  }

  Widget _textFieldPhone(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        border: new Border.all(
          color: Theme.of(context).colorScheme.surface,
          width: 1.0,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: con.phoneController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Telefono a 10 digitos',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buttonNext(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ElevatedButton(
          onPressed: con.validForm.value ? () => con.nextButton() : null,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          child: Text(
            'Siguiente',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ElevatedButton(
          onPressed:
              con.validFormPassword.value ? () => con.nextButton() : null,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          child: Text(
            'Siguiente',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
