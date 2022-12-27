import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:playpal/models/Slot/slot.model.dart';

import '../models/Bookings/bookings.model.dart';
import '../models/Transaction/transaction.model.dart';

class BookingService {
  static const String url = "https://playpal.herokuapp.com";

  static Future<Response> bookAGround(
      String? gid, String? dates, String? SlotID, String? uid) async {
    try {
      Response response;
      var dio = Dio();

      response = await dio.post(url + '/booking/book', data: {
        'groundID': gid,
        'userID': uid,
        'bookedSlot': SlotID,
        "dates": [dates]
      });

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Transaction> payNow(String? phoneNumber, int? amount) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.post(url + '/payment',
          data: {'phoneNumber': phoneNumber, 'amount': amount});
      final Transaction transaction =
          transactionFromJson(json.encode(response.data));
      return transaction;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  static Future<List<Bookings>> getMyBookings(String? userID) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get(url + '/booking/my-bookings',
          queryParameters: {"userID": userID});
      ;
      print(response.data);
      final bookings = bookingsFromJson(json.encode(response.data));
      return bookings;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
