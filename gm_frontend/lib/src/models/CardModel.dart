// To parse this JSON data, do
//
//     final cardModel = cardModelFromJson(jsonString);

import 'dart:convert';

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel {
  String? cardNumber;
  String? expiryDate;
  String? cardHolderName;
  String? cvvCode;

  CardModel({
    this.cardNumber,
    this.expiryDate,
    this.cardHolderName,
    this.cvvCode,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        cardNumber: json["cardNumber"],
        expiryDate: json["expiryDate"],
        cardHolderName: json["cardHolderName"],
        cvvCode: json["cvvCode"],
      );

  Map<String, dynamic> toJson() => {
        "cardNumber": cardNumber,
        "expiryDate": expiryDate,
        "cardHolderName": cardHolderName,
        "cvvCode": cvvCode,
      };
}
