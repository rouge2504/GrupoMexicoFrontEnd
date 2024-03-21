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

  static List<Car> fromJsonList(List<dynamic> jsonList) {
    List<Car> toList = [];

    jsonList.forEach((item) {
      Car car = Car.fromJson(item);
      toList.add(car);
    });
    return toList;
  }

  static String? toJsonList(List<Car> list) {
    var listMap = list.map((e) {
      return {
        "id": e.id,
        "image": e.image,
        "alias": e.alias,
        "number_plate": e.number_plate,
        "mark": e.mark,
        "year": e.year,
        "edge": e.edge
      };
    }).toList();

    String stringCar = json.encode(listMap);
    return stringCar;
  }

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["id"],
        image: json["image"],
        alias: json["alias"],
        number_plate: json["number_plate"],
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
