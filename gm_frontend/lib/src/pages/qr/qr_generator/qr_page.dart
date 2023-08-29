import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gm_frontend/src/pages/qr/qr_generator/qr_controller.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGeneratorPage extends StatelessWidget {
  QRGeneratorController con = Get.put(QRGeneratorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Aqui va un QR',
              style: TextStyle(fontSize: 30),
            ),
            Text('Hola'),
            QrImageView(data: con.temp.toString()),
          ],
        ),
      ),
    );
  }
}
