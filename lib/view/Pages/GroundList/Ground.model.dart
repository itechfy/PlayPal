// To parse this JSON data, do
//
//     final ground = groundFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

Map<String, Ground> groundFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, Ground>(k, Ground.fromJson(v)));

String groundToJson(Map<String, Ground> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Ground {
  Ground({
    required this.bookingRate,
    required this.description,
    required this.website,
    required this.verified,
    required this.lat,
    required this.lon,
    required this.mapAddress,
    required this.sports,
    required this.ownerId,
    required this.city,
    required this.closeAt,
    required this.name,
    required this.openAt,
    required this.owner,
  });

  int bookingRate;
  String description;
  String website;
  bool verified;
  String mapAddress;
  String sports;
  String ownerId;
  String city;
  String closeAt;
  String name;
  String openAt;
  double lat;
  double lon;
  Owner owner;

  factory Ground.fromJson(Map<String, dynamic> json) => Ground(
        bookingRate: json["bookingRate"],
        description: json["description"],
        website: json["website"],
        verified: json["verified"],
        lat: json["lat"],
        lon: json["lon"],
        mapAddress: json["mapAddress"],
        sports: json["sports"],
        ownerId: json["ownerID"],
        city: json["city"],
        closeAt: json["closeAt"],
        name: json["name"],
        openAt: json["openAt"],
        owner: Owner.fromJson(json["owner"]),
      );

  Map<String, dynamic> toJson() => {
        "bookingRate": bookingRate,
        "description": description,
        "website": website,
        "verified": verified,
        "mapAddress": mapAddress,
        "sports": sports,
        "ownerID": ownerId,
        "city": city,
        "closeAt": closeAt,
        "name": name,
        "openAt": openAt,
        "owner": owner.toJson(),
      };
}

class Owner {
  Owner({
    required this.displayName,
    required this.phoneNumber,
    required this.email,
    required this.groundId,
    required this.createdAt,
  });

  String displayName;
  String phoneNumber;
  String email;
  String groundId;
  CreatedAt createdAt;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        displayName: json["displayName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        groundId: json["groundID"],
        createdAt: CreatedAt.fromJson(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "phoneNumber": phoneNumber,
        "email": email,
        "groundID": groundId,
        "createdAt": createdAt.toJson(),
      };
}

class CreatedAt {
  CreatedAt({
    required this.seconds,
    required this.nanoseconds,
  });

  int seconds;
  int nanoseconds;

  factory CreatedAt.fromJson(Map<String, dynamic> json) => CreatedAt(
        seconds: json["_seconds"],
        nanoseconds: json["_nanoseconds"],
      );

  Map<String, dynamic> toJson() => {
        "_seconds": seconds,
        "_nanoseconds": nanoseconds,
      };
}
