import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:posweb/Model/User.dart';

class AuthService {
  final String baseUrl = 'http://127.0.0.1:8000/api/register'; // Update this if needed
  final storage = new FlutterSecureStorage();

  Future<User> register(String name, String phone, String? email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'phone_number': phone,
        'email': email ?? '',
      }),
    );

    if (response.statusCode == 201) {
      try {
        final data = jsonDecode(response.body);
        await storage.write(key: 'token', value: data['token']);
        return User.fromJson(data);
      } catch (e) {
        print('Error parsing JSON: $e');
        throw Exception('Failed to parse JSON: ${response.body}');
      }
    } else {
      print('Request failed with status: ${response.statusCode}, body: ${response.body}');
      throw Exception('Failed to register: ${response.body}');
    }
  }
}
