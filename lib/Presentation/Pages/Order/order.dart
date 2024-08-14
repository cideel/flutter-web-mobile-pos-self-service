import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Config/theme.dart';
import 'package:posweb/Presentation/Controller/AddOrderPopUp/popupController.dart';

class Order extends StatelessWidget {
  final OrderController orderController = Get.find<OrderController>();

  final int? customerId;
   Order({this.customerId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(375, 854),
        builder: (context, child) => Scaffold(
          body: Stack(
            children: [
              Obx(() => ListView.builder(
                    itemCount: orderController.cartItems.length,
                    itemBuilder: (context, index) {
                      var item = orderController.cartItems[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            Container(
                              width: 335.w,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['item_name'],
                                          maxLines: 2,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          item['item_description'],
                                          maxLines: 3,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          "Rp ${item['item_price']}",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        transformAlignment: Alignment.topCenter,
                                        height: 80.h,
                                        width: 80.w,
                                        child: Image.asset(
                                          "assets/image-order.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        width: 115.w,
                                        height: 35.h,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () => orderController
                                                  .decrementQuantity(index),
                                              icon: Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                              ),
                                              padding: EdgeInsets.zero,
                                              constraints: BoxConstraints(),
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              "${orderController.cartItems[index]['quantity']}",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            IconButton(
                                              onPressed: () => orderController
                                                  .incrementQuantity(index),
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                              padding: EdgeInsets.zero,
                                              constraints: BoxConstraints(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      );
                    },
                  )),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.grey, width: 0.3)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: Offset(4, 4),
                        spreadRadius: 1,
                        blurRadius: 15,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        spreadRadius: 1,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  height: 176.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text(
                            'Total Harga:',
                            style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 70.w),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                SizedBox(width: 20.w),
                                Image.asset(
                                  'assets/icon-money.png',
                                  width: 27.w,
                                  height: 27.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Obx(() => Text(
                                'Rp ${orderController.totalPrice.toStringAsFixed(0)}',
                                style: GoogleFonts.montserrat(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primary,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        height: 48.h,
                        width: 335.w,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColor.primary),
                          ),
                          onPressed: () async{
                              await orderController.sendOrderToBackend();

                          },
                          child: Text(
                            "Bayar",
                            style: GoogleFonts.roboto(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        height: 48.h,
                        width: 335.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primary),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Kembali",
                            style: GoogleFonts.roboto(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderAppBar extends GetxController {
  var title = "Pesanan".obs;
}