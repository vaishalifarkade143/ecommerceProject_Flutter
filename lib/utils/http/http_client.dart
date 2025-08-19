import 'package:http/http.dart' as http;
import 'dart:convert';

class THttpHelper {
  static const String _baseUrl =
      'https://api.example.com'; // Replace with your actual base URL
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final responce = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResonse(responce);
  }

  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResonse(response);
  }

  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResonse(response);
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final responce = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResonse(responce);
  }

  static Map<String, dynamic> _handleResonse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
