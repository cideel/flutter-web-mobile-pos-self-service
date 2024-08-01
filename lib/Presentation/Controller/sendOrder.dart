import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendOrderToBackend(int customerId, List<Map<String, dynamic>> cartItems, double totalPrice) async {
  final url = Uri.parse('http://127.0.0.1:8000/orders');
  
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer YOUR_API_TOKEN', // Tambahkan token otentikasi jika diperlukan
    },
    body: json.encode({
      'customer_id': customerId,
      'total_price': totalPrice,
      'order_items': cartItems.map((item) => {
        'item_id': item['id'],
        'quantity': item['quantity'],
      }).toList(),
    }),
  );

  if (response.statusCode == 201) {
    print('Order successfully created');
  } else {
    print('Failed to create order');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
