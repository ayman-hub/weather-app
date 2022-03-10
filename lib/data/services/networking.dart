import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future getData() async {
    try {
      Response response = await http.get(
        Uri.parse(url),
      );
      Map data = jsonDecode(response.toString());
      return data;
    } catch (e) {
      print(e);
    }
  }
}
