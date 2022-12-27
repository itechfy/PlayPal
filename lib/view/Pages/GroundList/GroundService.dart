import 'package:http/http.dart' as http;
import 'Ground.model.dart';

class GroundService {
  static const String url =
      "https://playpal.herokuapp.com/ground/ground-and-owner";

  static Future<Map<String, Ground>> getGrounds() async {
    try {
      final response = await http.get(Uri.parse(url));
      print("Success");
      final Map<String, Ground> grounds = groundFromJson(response.body);
      return grounds;
    } catch (e) {
      throw Exception(e);
    }
  }
}
