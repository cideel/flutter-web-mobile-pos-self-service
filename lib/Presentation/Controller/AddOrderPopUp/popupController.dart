import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;


class OrderController extends GetxController {
  var quantity = 1.obs;
  var cartItems = <Map<String, dynamic>>[].obs;
  var total_Price = 0.0.obs;

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

  Future<void> sendOrderToBackend({int? customerId}) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/orders');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer YOUR_API_TOKEN',
      },
      body: json.encode({
        'customer_id': customerId,
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
}
