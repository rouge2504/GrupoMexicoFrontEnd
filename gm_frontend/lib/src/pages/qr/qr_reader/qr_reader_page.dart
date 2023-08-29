import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gm_frontend/src/pages/payments/paid/payments_paid_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';

class QRReaderPage extends StatefulWidget {
  const QRReaderPage({super.key});
  @override
  State<QRReaderPage> createState() => _QRCodeWidgetState();
}

class _QRCodeWidgetState extends State<QRReaderPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String result = "";

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code!;
        if (result.isNotEmpty) {
          print('REsultado QR ${result}');
          print('Cambiando pagina');
          this.controller?.pauseCamera();
          //GetPage(name: '/payments/paid', page: () => PaymentPaidPage());
          Get.toNamed('/payments/paid');
        } else {
          this.controller?.resumeCamera();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ))
        ],
      ),
    );
  }
}
