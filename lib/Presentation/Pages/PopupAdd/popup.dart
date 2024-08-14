import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posweb/Config/theme.dart';
import 'package:posweb/Presentation/Controller/AddOrderPopUp/popupController.dart';

class AddOrderPopup extends StatelessWidget {
  final Map<String, dynamic> item;
  final OrderController orderController = Get.find<OrderController>();

  AddOrderPopup({required this.item});

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
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
                        child: Image.asset(
                          'assets/product-image-3.png',
                          width: 100.w,
                          height: 100.h,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['item_name'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  color: Colors.black, fontSize: 15.sp),
                            ),
                            Text(
                              item['item_description'],
                              style: GoogleFonts.montserrat(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w300),
                              maxLines: 2,
                            ),
                            Text(
                              'Rp ${item['item_price']}',
                              style: GoogleFonts.montserrat(
                                fontSize: 18.sp,
                                color: AppColor.primary,
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
                            icon: Icon(Icons.remove_circle_outline_outlined),
                            onPressed: orderController.decrement,
                          ),
                          Obx(() => Text(
                                '${orderController.quantity.value}',
                                style: TextStyle(fontSize: 18.sp),
                              )),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline_outlined),
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
                    var newItem = {
                      'item_id': item['item_id'],
                      'item_name': item['item_name'],
                      'item_description': item['item_description'],
                      'item_price': item['item_price'],
                      'image_url': item['image_url'],
                      'quantity': orderController.quantity.value,
                    };
                    orderController.addToCart(newItem);
                    orderController.resetQuantity();
                    Get.back();
                  },
                  child: Text('Masukan Keranjang',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.w, vertical: 10.h),
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
