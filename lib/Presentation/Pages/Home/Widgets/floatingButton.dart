import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posweb/Config/router.dart';
import 'package:posweb/Config/theme.dart';
import 'package:posweb/Presentation/Controller/AddOrderPopUp/popupController.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final OrderController orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: orderController.totalItems > 0,
        child: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed(MyPage.order);
          },
          label: Text('Items: ${orderController.totalItems} | Total: Rp ${orderController.totalPrice.toStringAsFixed(0)}'),
          icon: Icon(Icons.shopping_cart),
          backgroundColor: AppColor.primary,
        ),
      );
    });
  }
}
