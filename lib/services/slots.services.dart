import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:playpal/models/Slot/slot.model.dart';

class SlotService {
  static const String url = "https://playpal.herokuapp.com/booking/slots";

  static Future<List<Slot>> getAvailableSlots(String? gid, String date) async {
    try {
      Response response;
      var dio = Dio();
      response =
          await dio.get(url, queryParameters: {"groundID": gid, "date": date});

      print(response.data.toString());
      final slots = slotFromJson(jsonEncode(response.data));

      return slots;
    } catch (e) {
      throw Exception(e);
    }
  }
}
