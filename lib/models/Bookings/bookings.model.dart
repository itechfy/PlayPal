// To parse this JSON data, do
//
//     final bookings = bookingsFromJson(jsonString);

import 'dart:convert';

List<Bookings> bookingsFromJson(String str) => List<Bookings>.from(json.decode(str).map((x) => Bookings.fromJson(x)));

String bookingsToJson(List<Bookings> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bookings {
    Bookings({
        required this.name,
        required this.location,
        required this.slots,
        required this.price,
    });

    String name;
    String location;
    List<dynamic> slots;
    int price;

    factory Bookings.fromJson(Map<String, dynamic> json) => Bookings(
        name: json["name"],
        location: json["location"],
        slots: List<dynamic>.from(json["slots"].map((x) => x)),
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "location": location,
        "slots": List<dynamic>.from(slots.map((x) => x)),
        "price": price,
    };
}

class SlotClass {
    SlotClass({
        this.startTime,
        this.closeTime,
    });

    String? startTime;
    String? closeTime;

    factory SlotClass.fromJson(Map<String, dynamic> json) => SlotClass(
        startTime: json["startTime"],
        closeTime: json["closeTime"],
    );

    Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "closeTime": closeTime,
    };
}