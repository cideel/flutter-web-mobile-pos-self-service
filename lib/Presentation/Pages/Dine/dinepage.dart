import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:posweb/Config/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DineConfirm extends StatelessWidget {
  const DineConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 854),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Center(
                  child: Container(
                    alignment: Alignment.topRight,
                    height: 74.01.h,
                    width: 100.h,
                    child: Image.asset(
                      "assets/image-icon.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Point of Sales",
                  style: GoogleFonts.roboto(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Mau makan disini atau dibawa pulang?",
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      color: AppColor.primary,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 35.82.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 282.35.h,
                      width: 160.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                              height: 96.h,
                              width: 96.w,
                              child: Image.asset(
                                'assets/bungkus-icon.png',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            height: 11.h,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Bawa\nPulang",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                                color: Color(0xFF2B7A7F)),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                offset: Offset(1, 1),
                                spreadRadius: 1,
                                blurRadius: 5),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-1, -1),
                                spreadRadius: 1,
                                blurRadius: 5)
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xF9F9FB),
                          border: Border.all(color: AppColor.primary)),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Container(
                      height: 282.35.h,
                      width: 160.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                              height: 96.h,
                              width: 96.w,
                              child: Image.asset(
                                'assets/makan-icon.png',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            height: 11.h,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Makan\nDitempat",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                                color: Color(0xffF9F9FB)),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                offset: Offset(1, 1),
                                spreadRadius: 1,
                                blurRadius: 5),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-1, -1),
                                spreadRadius: 1,
                                blurRadius: 5)
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.primary,
                          border: Border.all(color: AppColor.primary)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Segera pesan dan rasakan citarasa yang\nbelum pernah kamu coba!",
                  style: GoogleFonts.montserrat(
                      fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
