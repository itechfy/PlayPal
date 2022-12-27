import 'package:dio/dio.dart';

class UserService {
  static const String url = "https://playpal.herokuapp.com";

  static Future<Response> createUser(String? uid, String? role,
      String? displayName, String? phoneNumber) async {
    try {
      Response response;
      var dio = Dio();

      response = await dio.post(url + '/user', data: {
        'userID': uid,
        'role': role,
        'displayName': displayName,
        "phoneNumber": phoneNumber,
      });

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
