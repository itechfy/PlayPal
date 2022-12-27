import 'dart:io';

import 'package:dio/dio.dart';

class CoachService {
  static const String url = "https://playpal.herokuapp.com";

  static Future<Response> isCoachVerified(String? cid) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get(url + '/user/coach-check/${cid}');
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Response> sendDataForVerification(var formData) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.post(url + '/upload-image/coach', data: formData);
      return response;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        print(e);
      }
      throw Exception(e);
    }
  }
}
