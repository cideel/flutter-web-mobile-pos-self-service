
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuControl extends GetxController {
  var menuItems = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMenuItems();
    super.onInit();
  }

  void fetchMenuItems() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/menu-items')); // Replace with actual API URL
      if (response.statusCode == 200) {
        var items = jsonDecode(response.body);
        print(items); // Log the API response
        menuItems.assignAll(items);
      } else {
        print('Failed to fetch menu items: ${response.body}');
        Get.snackbar('Error', 'Failed to fetch menu items');
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchMenuItemsByType(String type) async {
    isLoading(true);
    try {
      print('Fetching menu items of type: $type');
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/menu-items/type/$type'));
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        var items = jsonDecode(response.body);
        print('Items fetched: ${items.length}');
        menuItems.value = items;
      } else {
        print('Failed to load menu items. Status code: ${response.statusCode}');
        menuItems.value = []; // Pastikan menuItems kosong jika gagal
      }
    } catch (e) {
      print('Error: $e');
      menuItems.value = []; // Pastikan menuItems kosong jika ada error
    } finally {
      isLoading(false);
      print('Loading status: ${isLoading.value}');
    }
  }


  void fetchMenuItemsByLabel(String label) async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('http://127.0.0.1:8000/api/menu-items/label/$label'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        menuItems.value = data;
      } else {
        Get.snackbar('Error', 'Failed to fetch menu items by label');
      }
    } finally {
      isLoading(false);
    }
  }
}
