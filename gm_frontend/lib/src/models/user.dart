// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';
import 'package:gm_frontend/src/models/Car.dart';
import 'package:gm_frontend/src/models/CardModel.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id; //NULL SAFETY
  String? email;
  String? name;
  String? lastname;
  String? phone;
  String? image;
  String? password;
  String? sessionToken;
  List<Car>? cars = [];
  List<CardModel>? cardModels = [];

  User(
      {this.id,
      this.email,
      this.name,
      this.lastname,
      this.phone,
      this.image,
      this.password,
      this.sessionToken,
      this.cars,
      this.cardModels});

  factory User.fromJson(Map<String, dynamic> _json) => User(
        id: _json["id"].toString(),
        email: _json["email"],
        name: _json["name"],
        lastname: _json["lastname"],
        phone: _json["phone"],
        image: _json["image"],
        password: _json["password"],
        sessionToken: _json["session_token"],
        cars: _json["cars"] == null
            ? []
            : Car.fromJsonList(json.decode(_json["cars"])),
        /*: List<Car>.from(json["cars"].map((model) => Car.fromJson(model))),*/
        cardModels: _json["cards"] == null
            ? []
            : List<CardModel>.from(
                _json["cards"].map((model) => CardModel.fromJson(model))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "lastname": lastname,
        "phone": phone,
        "image": image,
        "password": password,
        "session_token": sessionToken,
        "cars": Car.toJsonList(cars!).toString(),
        "cardModels": cardModels,
      };
}
