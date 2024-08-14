import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static Future<void> saveUser(String token, int customerId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setInt('customerId', customerId);
  }

  static Future<Map<String, dynamic>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int? customerId = prefs.getInt('customerId');

    return {
      'token': token,
      'customerId': customerId,
    };
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('customerId');
  }
}
