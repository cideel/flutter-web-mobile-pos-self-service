import 'package:get/get.dart';

class OrderController extends GetxController {
  var quantity = 1.obs; // Menggunakan observable untuk jumlah item

  void increment() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }
}
