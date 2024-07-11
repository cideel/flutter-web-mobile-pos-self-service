import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:posweb/Config/theme.dart';
import 'package:posweb/Presentation/Controller/AddOrderPopUp/popupController.dart';

class AddOrderPopup extends StatelessWidget {
  final OrderController orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 318.h,
            width: 341.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Get.back(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/product-image-3.png',
                        width: 100.w,
                        height: 100.h,
                      ), // Ganti dengan gambar yang sesuai
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Air Mineral Aqua 600 ML',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Minuman menyegarkan',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Rp 20.000',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jumlah'),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: orderController.decrement,
                          ),
                          Obx(() => Text(
                            '${orderController.quantity.value}',
                            style: TextStyle(fontSize: 16),
                          )),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: orderController.increment,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () {
                    // Logic untuk menambahkan ke keranjang
                    Get.back();
                  },
                  child: Text('Masukan Keranjang',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
