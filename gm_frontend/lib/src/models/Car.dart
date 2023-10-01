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
  String? edges;

  Car({
    this.id,
    this.image,
    this.alias,
    this.number_plate,
    this.mark,
    this.model,
    this.year,
    this.edges,
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
        "numberPlate": e.number_plate,
        "mark": e.mark,
        "year": e.year,
        "edges": e.edges
      };
    }).toList();

    String stringCar = json.encode(listMap);
    return stringCar;
  }

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["id"],
        image: json["image"],
        alias: json["alias"],
        number_plate: json["numberPlate"],
        mark: json["mark"],
        model: json["model"],
        year: json["year"],
        edges: json["edges"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "alias": alias,
        "number_plate": number_plate,
        "mark": mark,
        "model": model,
        "year": year,
        "edges": edges,
      };
}
