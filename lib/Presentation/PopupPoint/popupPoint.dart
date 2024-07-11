import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posweb/Config/theme.dart';

void showCustomDialog() {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Container(
        width: 280.w,
        height: 269.h ,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '0813827638576',
              style: GoogleFonts.roboto(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              'Irawan Budiman',
              style: GoogleFonts.montserrat(fontSize: 15.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              'KhoirulZulkarnaen@gmail.com',
              style: GoogleFonts.montserrat(fontSize: 15.sp),
            ),
            SizedBox(height: 10.h),
            Text(
              'Point: 30',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppColor.primary),
            ),
            SizedBox(height: 10.h),
            Text(
              'Tekan “YA” jika kamu ingin\nmenggunakan point mu',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(fontSize: 13.sp),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(height: 48.h,width: 96.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: AppColor.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Tidak',
                      style: TextStyle(color: AppColor.primary),
                    ),
                  ),
                ),
                Container(
                  width: 96.w,
                  height: 48.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                    },
                    child: Text('Ya',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
