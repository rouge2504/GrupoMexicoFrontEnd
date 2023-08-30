import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Stack(
        children: [
          _boxForm(context),
        ],
      ),
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

  Widget _boxForm(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black54,
          blurRadius: 15,
          offset: Offset(0, 0.75),
        )
      ]),
      child: Column(
        children: [
          _Title(),
          _textFieldName(context),
          _textFieldEmail(context),
          _textFieldPhone(context),
          //_buttonRegister(context)
        ],
      ),
    );
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

  Widget _textFieldEmail(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
          textAlign: TextAlign.left,
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
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Nombre y apellido',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _textFieldPhone(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Telefono a 10 digitos',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buttonRegister(BuildContext context) {
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
}
