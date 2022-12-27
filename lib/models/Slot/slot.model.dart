import 'dart:convert';

List<Slot> slotFromJson(String str) =>
    List<Slot>.from(json.decode(str).map((x) => Slot.fromJson(x)));

String slotToJson(List<Slot> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Slot {
  Slot({
    this.closeTime,
    this.startTime,
    this.slotId,
  });

  String? closeTime;
  String? startTime;
  String? slotId;

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        closeTime: json["closeTime"] == null ? "" : json["closeTime"],
        startTime: json["startTime"] == null ? "" : json["startTime"],
        slotId: json["slotID"],
      );

  Map<String, dynamic> toJson() => {
        "closeTime": closeTime == null ? "" : closeTime,
        "startTime": startTime == null ? "" : startTime,
        "slotID": slotId,
      };
}
