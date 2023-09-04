// To parse this JSON data, do
//
//     final costumerMercadoPago = costumerMercadoPagoFromJson(jsonString);

import 'dart:convert';

CostumerMercadoPago costumerMercadoPagoFromJson(String str) =>
    CostumerMercadoPago.fromJson(json.decode(str));

String costumerMercadoPagoToJson(CostumerMercadoPago data) =>
    json.encode(data.toJson());

class CostumerMercadoPago {
  Paging? paging;
  List<Result>? results;

  CostumerMercadoPago({
    this.paging,
    this.results,
  });

  factory CostumerMercadoPago.fromJson(Map<String, dynamic> json) =>
      CostumerMercadoPago(
        paging: Paging.fromJson(json["paging"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "paging": paging!.toJson(),
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Paging {
  int? limit;
  int? offset;
  int? total;

  Paging({
    this.limit,
    this.offset,
    this.total,
  });

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        limit: json["limit"],
        offset: json["offset"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "offset": offset,
        "total": total,
      };
}

class Result {
  Address? address;
  List<dynamic>? addresses;
  List<dynamic>? cards;
  String? dateCreated;
  String? dateLastUpdated;
  dynamic? dateRegistered;
  dynamic? defaultAddress;
  dynamic? defaultCard;
  dynamic? description;
  String? email;
  dynamic? firstName;
  String? id;
  Identification? identification;
  dynamic? lastName;
  bool? liveMode;
  Phone? phone;

  Result({
    this.address,
    this.addresses,
    this.cards,
    this.dateCreated,
    this.dateLastUpdated,
    this.dateRegistered,
    this.defaultAddress,
    this.defaultCard,
    this.description,
    this.email,
    this.firstName,
    this.id,
    this.identification,
    this.lastName,
    this.liveMode,
    this.phone,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        address: Address.fromJson(json["address"]),
        addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
        cards: List<dynamic>.from(json["cards"].map((x) => x)),
        dateCreated: json["date_created"],
        dateLastUpdated: json["date_last_updated"],
        dateRegistered: json["date_registered"],
        defaultAddress: json["default_address"],
        defaultCard: json["default_card"],
        description: json["description"],
        email: json["email"],
        firstName: json["first_name"],
        id: json["id"],
        identification: Identification.fromJson(json["identification"]),
        lastName: json["last_name"],
        liveMode: json["live_mode"],
        phone: Phone.fromJson(json["phone"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address!.toJson(),
        "addresses": List<dynamic>.from(addresses!.map((x) => x)),
        "cards": List<dynamic>.from(cards!.map((x) => x)),
        "date_created": dateCreated,
        "date_last_updated": dateLastUpdated,
        "date_registered": dateRegistered,
        "default_address": defaultAddress,
        "default_card": defaultCard,
        "description": description,
        "email": email,
        "first_name": firstName,
        "id": id,
        "identification": identification!.toJson(),
        "last_name": lastName,
        "live_mode": liveMode,
        "phone": phone!.toJson(),
      };
}

class Address {
  dynamic? id;
  dynamic? zipCode;
  dynamic? streetName;
  dynamic? streetNumber;
  dynamic? city;

  Address({
    this.id,
    this.zipCode,
    this.streetName,
    this.streetNumber,
    this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        zipCode: json["zip_code"],
        streetName: json["street_name"],
        streetNumber: json["street_number"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "zip_code": zipCode,
        "street_name": streetName,
        "street_number": streetNumber,
        "city": city,
      };
}

class Identification {
  dynamic type;
  dynamic number;

  Identification({
    this.type,
    this.number,
  });

  factory Identification.fromJson(Map<String, dynamic> json) => Identification(
        type: json["type"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "number": number,
      };
}

class Phone {
  dynamic areaCode;
  dynamic number;

  Phone({
    this.areaCode,
    this.number,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        areaCode: json["area_code"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "area_code": areaCode,
        "number": number,
      };
}
