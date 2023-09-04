import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gm_frontend/src/pages/payments/create/client/create_client_controller.dart';

class CreateClientPage extends StatelessWidget {
  CreateClientController con = CreateClientController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldEmail(context),
            TextFieldName(context),
            TextFieldLastName(context),
            TextFieldAreaNumber(context),
            TextFieldPhoneNumber(context),
            ElevatedButton(
              onPressed: con.createClient,
              child: Text('Enviar'),
            ),
            ElevatedButton(
              onPressed: con.findClient,
              child: Text('Find Client'),
            ),
          ],
        ),
      ),
    );
  }

  Widget TextFieldEmail(BuildContext context) {
    return Container(
      child: TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget TextFieldName(BuildContext context) {
    return Container(
      child: TextField(
        controller: con.nameController,
        decoration: InputDecoration(
          hintText: 'Nombre',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget TextFieldLastName(BuildContext context) {
    return Container(
      child: TextField(
        controller: con.lastNameController,
        decoration: InputDecoration(
          hintText: 'Apellido',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget TextFieldAreaNumber(BuildContext context) {
    return Container(
      child: TextField(
        controller: con.areaPhoneController,
        decoration: InputDecoration(
          hintText: 'Area number',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget TextFieldPhoneNumber(BuildContext context) {
    return Container(
      child: TextField(
        controller: con.phoneController,
        decoration: InputDecoration(
          hintText: 'Telefono',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
