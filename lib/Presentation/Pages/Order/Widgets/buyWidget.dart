import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:posweb/Config/icon.dart';
import 'package:posweb/Config/router.dart';
import 'package:posweb/Config/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 500.h,
      child: FloatingActionButton(
        onPressed: () {
          Get.toNamed(MyPage.order);
          // Define your onPressed functionality here
        },
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(41.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon-float.png",
              width: 30.w,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              "100 Menu",
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              "Rp 5.930.000",
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
