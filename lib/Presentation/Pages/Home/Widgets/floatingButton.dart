import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        child: Container(
          width: 308.w,
          height: 42.h,
          decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(41.r)),
          child: FloatingActionButton.extended(
              backgroundColor: AppColor.primary,
              onPressed: () {
                Get.toNamed(MyPage.order);
              },
              label: Row(
                children: [
                  Image.asset(
                    'assets/icon-float.png',
                    height: 15.h,
                    width: 25.w,
                  ),
                                    SizedBox(width: 8.0.w),

                  Text(
                    'Items: ${orderController.totalItems}',
                    style: GoogleFonts.montserrat(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8.0.w),
                  Text(
                              'Total: Rp ${orderController.totalPrice.toStringAsFixed(0)}',
                              style: GoogleFonts.montserrat(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                  
                ],
              )),
        ),
      );
    });
  }
}
