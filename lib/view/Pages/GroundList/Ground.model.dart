// To parse this JSON data, do
//
//     final ground = groundFromJson(jsonString);

import 'dart:convert';

List<Ground> groundFromJson(String str) =>
    List<Ground>.from(json.decode(str).map((x) => Ground.fromJson(x)));

String groundToJson(List<Ground> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ground {
  Ground({
    required this.id,
    required this.rawalpindi,
    required this.islamabad,
  });

  String id;
  List<City> rawalpindi;
  List<City> islamabad;

  factory Ground.fromJson(Map<String, dynamic> json) => Ground(
        id: json["id"],
        rawalpindi:
            List<City>.from(json["rawalpindi"].map((x) => City.fromJson(x))),
        islamabad:
            List<City>.from(json["islamabad"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rawalpindi": List<dynamic>.from(rawalpindi.map((x) => x.toJson())),
        "islamabad": List<dynamic>.from(islamabad.map((x) => x.toJson())),
      };
}

class City {
  City({
    this.price,
    required this.ownerId,
    required this.location,
    required this.name,
    required this.status,
    required this.id,
    this.verified,
  });

  dynamic price;
  String ownerId;
  String location;
  String name;
  String status;
  String id;
  bool? verified;

  factory City.fromJson(Map<String, dynamic> json) => City(
        price: json["price"],
        ownerId: json["ownerId"],
        location: json["location"],
        name: json["name"],
        status: json["status"],
        id: json["id"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "ownerId": ownerId,
        "location": location,
        "name": name,
        "status": status,
        "id": id,
        "verified": verified,
      };
}
