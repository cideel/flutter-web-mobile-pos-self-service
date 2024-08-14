import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:posweb/Presentation/Pages/Register/Controller/auth_controller.dart';


class OrderController extends GetxController {
  var quantity = 1.obs;
  var cartItems = <Map<String, dynamic>>[].obs;
  var total_Price = 0.0.obs;
  var orders = [].obs;

  var isLoading = true.obs;

  void increment() => quantity.value++;
  void decrement() {
    if (quantity.value > 1) quantity.value--;
  }

  void addToCart(Map<String, dynamic> item) {
    var existingItem = cartItems.firstWhereOrNull((element) => element['id'] == item['id'] && element['item_name'] == item['item_name']);
    if (existingItem != null) {
      existingItem['quantity'] += item['quantity'];
    } else {
      var newItem = {
        ...item,
        'quantity': item['quantity'],
        'item_price': double.parse(item['item_price'].toString()) // Pastikan item_price menjadi double
      };
      cartItems.add(newItem);
    }
    cartItems.refresh(); // Tambahkan ini agar perubahan terdeteksi
  }

  void resetQuantity() {
    quantity.value = 1;
  }

  int get totalItems => cartItems.fold(0, (sum, item) => sum + (item['quantity'] as int));
  double get totalPrice => cartItems.fold(0.0, (sum, item) => sum + (item['item_price'] * item['quantity']));

  void incrementQuantity(int index) {
    cartItems[index]['quantity']++;
    cartItems.refresh();
  }

  void decrementQuantity(int index) {
    if (cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
    } else {
      cartItems.removeAt(index);
    }
    cartItems.refresh(); // Pastikan GetX mendeteksi perubahan
  }

  Future<void> sendOrderToBackend() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/orders');
      final AuthController authController = Get.find(); // Dapatkan instance AuthController

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authController.token.value}',
      },
      body: json.encode({
        'total_price': totalPrice,
        'order_items': cartItems.map((item) => {
          'item_id': item['item_id'],
          'quantity': item['quantity'],
        }).toList(),
      }),
    );

    if (response.statusCode == 201) {
      print('Order successfully created');
      cartItems.clear();
    } else {
      print('Failed to create order');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }
 Future<void> fetchOrderHistory() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/orders/history');
    final AuthController authController = Get.find<AuthController>();

    print("Fetching order history...");
    print("Token: ${authController.token.value}");

    // Tidak perlu pengecekan null jika token.value tidak bisa null
    if (authController.token.value.isEmpty) {
      print("Token is empty");
      return;
    }

    isLoading.value = true;
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${authController.token.value}',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        orders.value = data['orders'];
        print('Order history fetched successfully: $data');
      } else {
        print('Failed to fetch order history');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}