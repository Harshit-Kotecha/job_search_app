import 'package:flutter/services.dart';

class Request {
  Request._();

  // make the request and return the response
  static Future<String> readJson(String url) async {
    final String response = await rootBundle.loadString(
      url,
    );
    return response;
  }
}
