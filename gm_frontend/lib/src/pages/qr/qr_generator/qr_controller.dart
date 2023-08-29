import 'dart:convert';

import 'package:get/get.dart';
import 'package:gm_frontend/src/models/QrMolding.dart';

class QRGeneratorController extends GetxController {
  QrMolding? qrMolding;

  dynamic? temp;

  QRController() {
    qrMolding = QrMolding.n("Dante", "12313123", "12313123", "765454",
        "898989669", 200.00, 1, 1, 1, "rtrejo@gmail.com");
    /*qrMolding?.nameUser = "Dante";
    qrMolding?.paymentMethodId = "123131231312";
    qrMolding?.paymentTypeId = "765454";
    qrMolding?.issuerId = "898989669";
    qrMolding?.transactionAmount = 200.00;
    qrMolding?.installments = 1;
    qrMolding?.quantity = 1;
    qrMolding?.unitPrice = 1;
    qrMolding?.emailCostumer = "rtrejo@gmail.com";*/
/*
    temp =
        '{"nameUser: "Dante", "paymentMethodId": "123131231312", "paymentTypeId": "765454", "issuerId": "898989669", "transactionAmount": 200.00, "installments": 1, "quantity": 1, "unitPrice": 1, "emailCostumer": "rtrejo@gmail.com"}';
    QrMolding qrTemp = QrMolding.fromJson(jsonEncode(temp));*/
    temp = qrMolding?.toJson();
    print('Nombre en QR: ${qrMolding?.nameUser}');
    print('Temporal: ${temp}');
  }
}
