// To parse this JSON data, do
//
//     final car = carFromJson(jsonString);

import 'dart:convert';

Car carFromJson(String str) => Car.fromJson(json.decode(str));

String carToJson(Car data) => json.encode(data.toJson());

class Car {
  String? id;
  String? image;
  String? alias;
  String? number_plate;
  String? mark;
  String? model;
  String? year;
  String? edge;

  Car({
    this.id,
    this.image,
    this.alias,
    this.number_plate,
    this.mark,
    this.model,
    this.year,
    this.edge,
  });

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["id"],
        image: json["image"],
        alias: json["alias"],
        number_plate: json["numberPlate"],
        mark: json["mark"],
        model: json["model"],
        year: json["year"],
        edge: json["edge"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "alias": alias,
        "number_plate": number_plate,
        "mark": mark,
        "model": model,
        "year": year,
        "edge": edge,
      };
}
