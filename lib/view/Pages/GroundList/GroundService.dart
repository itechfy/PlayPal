import 'package:http/http.dart' as http;
import 'Ground.model.dart';

class GroundService {
  static const String url = "https://play-o.herokuapp.com/grounds";

  static Future<List<Ground>> getGrounds() async {
    try {
      final response = await http.get(Uri.parse(url));
      print("Success");
      final List<Ground> grounds = groundFromJson(response.body);
      return grounds;
    } catch (e) {
      return List<Ground>.empty();
    }
  }
}
