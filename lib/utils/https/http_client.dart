import 'dart:convert';

import 'package:http/http.dart' as http;

class KHttpHelper {
  static const String baseUrl = "";

  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse("$baseUrl/$endpoint"));
    return handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse("$baseUrl/$endpoint"),
      headers: {"content-Type": "app/json"},
      body: json.encode(data),
    );
    return handleResponse(response);
  }

  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$endpoint"),
      headers: {"content-Type": "app/json"},
      body: json.encode(data),
    );
    return handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse("$baseUrl/$endpoint"));
    return handleResponse(response);
  }

  static Map<String, dynamic> handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed To Load Data ${response.statusCode}");
    }
  }
}
