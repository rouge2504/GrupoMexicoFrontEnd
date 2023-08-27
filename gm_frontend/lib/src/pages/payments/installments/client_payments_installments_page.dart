import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/pages/payments/installments/client_payments_installments.controller.dart';

class ClientPaymentsIntallmentsPage extends StatelessWidget {
  ClientPaymentsIntallmentsController con =
      Get.put(ClientPaymentsIntallmentsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: Container(
            color: Color.fromARGB(245, 245, 245, 1),
            height: 180,
            child: _totalToPay(context),
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'Cuotas',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ));
  }

  Widget _totalToPay(BuildContext context) {
    return Column(
      children: [
        Divider(height: 1, color: Colors.grey[300]),
        Container(
          margin: EdgeInsets.only(left: 20, top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total: \$${con.total.value}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: ElevatedButton(
            onPressed: () => con.createPayment(),
            style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
            child: Text(
              'CONFIRMAR PAGO',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
