import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:posweb/Config/router.dart';
import 'package:posweb/Presentation/Pages/Home/home.dart';
import 'dart:convert';

import 'package:posweb/main.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var token = ''.obs;

  Future<void> register(String name, String phoneNumber, String email) async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'phone_number': phoneNumber,
          'email': email,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Registration successful');
      } else if (response.statusCode == 422) {
        final Map<String, dynamic> errors = jsonDecode(response.body);
        Get.snackbar('Error', 'Registration failed: ${errors['message']}');
      } else {
        Get.snackbar('Error', 'Registration failed: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
  void setToken(String newToken) {
    token.value = newToken;
    print("Token set: $newToken");
  }

  Future<void> login(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      Get.snackbar('Error', 'Please enter your phone number.');
      return;
    }

    isLoading.value = true;
    try {
      print('Sending request to login with phone number: $phoneNumber');
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'phone_number': phoneNumber,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        Get.snackbar('Success', 'Login successful');
        // Optionally navigate to another screen or save the token
        token.value = data['token'];        
        print('Token saved: ${token.value}');
        // Navigate to the navbar page
        Get.offAllNamed(MyPage.home); // Use your route name here
      } else if (response.statusCode == 401) {
        final Map<String, dynamic> errors = jsonDecode(response.body);
        Get.snackbar('Error', 'Login failed: ${errors['message']}');
      } else {
        Get.snackbar('Error', 'Login failed: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}