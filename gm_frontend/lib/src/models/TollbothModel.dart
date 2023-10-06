// To parse this JSON data, do
//
//     final tollbothModel = tollbothModelFromJson(jsonString);

import 'dart:convert';

TollbothModel tollbothModelFromJson(String str) =>
    TollbothModel.fromJson(json.decode(str));

String tollbothModelToJson(TollbothModel data) => json.encode(data.toJson());

class TollbothModel {
  String? name;
  String? adress;
  String? lat;
  String? lon;
  String? distance;
  String? cost;

  TollbothModel({
    this.name,
    this.adress,
    this.lat,
    this.lon,
    this.distance,
    this.cost,
  });

  static List<TollbothModel> fromJsonList(List<dynamic> jsonList) {
    List<TollbothModel> toList = [];

    jsonList.forEach((item) {
      TollbothModel car = TollbothModel.fromJson(item);
      toList.add(car);
    });
    return toList;
  }

  static String? toJsonList(List<TollbothModel> list) {
    var listMap = list.map((e) {
      return {
        "name": e.name,
        "adress": e.adress,
        "lat": e.lat,
        "lon": e.lon,
        "distance": e.distance,
        "cost": e.cost
      };
    }).toList();

    String stringTollbothModel = json.encode(listMap);
    return stringTollbothModel;
  }

  factory TollbothModel.fromJson(Map<String, dynamic> json) => TollbothModel(
        name: json["name"],
        adress: json["adress"],
        lat: json["lat"],
        lon: json["lon"],
        distance: json["distance"],
        cost: json["cost"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "adress": adress,
        "lat": lat,
        "lon": lon,
        "distance": distance,
        "cost": cost,
      };
}
