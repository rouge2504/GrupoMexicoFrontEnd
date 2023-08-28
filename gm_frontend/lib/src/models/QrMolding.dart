// To parse this JSON data, do
//
//     final qrMolding = qrMoldingFromJson(jsonString);

import 'dart:convert';

QrMolding qrMoldingFromJson(String str) => QrMolding.fromJson(json.decode(str));

String qrMoldingToJson(QrMolding data) => json.encode(data.toJson());

class QrMolding {
  String? nameUser;
  String? token;
  String? paymentMethodId;
  String? paymentTypeId;
  String? issuerId;
  double? transactionAmount;
  int? installments;
  int? quantity;
  int? unitPrice;
  String? emailCostumer;

  QrMolding({
    this.nameUser,
    this.token,
    this.paymentMethodId,
    this.paymentTypeId,
    this.issuerId,
    this.transactionAmount,
    this.installments,
    this.quantity,
    this.unitPrice,
    this.emailCostumer,
  });

  QrMolding.n(
      String nameUser,
      String token,
      String paymentMethodId,
      String paymentTypeId,
      String issuerId,
      double transactionAmount,
      int installments,
      int quantity,
      int unitPrice,
      String emailCostumer) {
    this.nameUser = nameUser;
    this.token = token;
    this.paymentMethodId = paymentMethodId;
    this.paymentTypeId = paymentTypeId;
    this.issuerId = issuerId;
    this.transactionAmount = transactionAmount;
    this.installments = installments;
    this.quantity = quantity;
    this.unitPrice = unitPrice;
    this.emailCostumer = emailCostumer;
  }

  factory QrMolding.fromJson(Map<String, dynamic> json) => QrMolding(
        nameUser: json["nameUser"],
        token: json["token"],
        paymentMethodId: json["paymentMethodId"],
        paymentTypeId: json["paymentTypeId"],
        issuerId: json["issuerId"],
        transactionAmount: json["transactionAmount"],
        installments: json["installments"],
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
        emailCostumer: json["emailCostumer"],
      );

  Map<String, dynamic> toJson() => {
        "nameUser": nameUser,
        "token": token,
        "paymentMethodId": paymentMethodId,
        "paymentTypeId": paymentTypeId,
        "issuerId": issuerId,
        "transactionAmount": transactionAmount,
        "installments": installments,
        "quantity": quantity,
        "unit_price": unitPrice,
        "emailCostumer": emailCostumer,
      };
}
