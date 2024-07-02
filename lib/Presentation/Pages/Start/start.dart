import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:posweb/Config/router.dart';
import 'package:posweb/Config/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ScreenUtilInit(
      designSize: const Size(375, 854),
      minTextAdapt: true,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 25.5.h,
            ),
            Container(
              height: 89.h,
              width: 379.w,
              alignment: Alignment.center,
              child: Text(
                "POS",
                style: GoogleFonts.roboto(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColor.primary),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              alignment: Alignment.topLeft,
              child: Text(
                "Promo buat kamu",
                style: GoogleFonts.roboto(
                    fontSize: 32.sp,
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              alignment: Alignment.topLeft,
              child: Text(
                "Makanan enak, mood enak, jalanin hari jadi enak!",
                style: GoogleFonts.montserrat(
                    fontSize: 13.sp,
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 229.h,
                          width: 335.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/iklan-r.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 231.h,
                          width: 335.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/iklan-r.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Text(
                    "Ayo Mulai Petualangan Rasa!",
                    style: GoogleFonts.roboto(
                        fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "Kelezatan hanya dengan satu ketukan.",
                    style: GoogleFonts.montserrat(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Container(
                    width: 335.w,
                    height: 70.h,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(4, 4)),
                      BoxShadow(
                          color: Colors.white,
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(-4, -4))
                    ]),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(MyPage.dineConfirm);
                        },
                        style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all(Colors.black),
                            backgroundColor:
                                MaterialStateProperty.all(AppColor.primary),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: Text(
                          "Menu",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 156.w,
                        height: 50.h,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              spreadRadius: 1,
                              offset: Offset(4, 4),
                              blurRadius: 15),
                          BoxShadow(
                              color: Colors.white,
                              spreadRadius: 1,
                              offset: Offset(-4, -4),
                              blurRadius: 15)
                        ]),
                        child: ElevatedButton(
                            onPressed: (){
                              Get.toNamed(MyPage.register);
                            }, // Logic Daftar,
                            style: ButtonStyle(
                                shadowColor:
                                    MaterialStateProperty.all(Colors.black),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: AppColor.primary,
                                            width: 2.w),
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            child: Text(
                              "Daftar",
                              style: GoogleFonts.roboto(
                                  color: AppColor.primary,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Container(
                        width: 156.w,
                        height: 50.h,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              offset: Offset(4, 4),
                              spreadRadius: 1,
                              blurRadius: 15),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              spreadRadius: 1,
                              blurRadius: 15)
                        ]),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(MyPage.login);
                            }, // LOGIC,
                            style: ButtonStyle(
                                shadowColor:
                                    MaterialStateProperty.all(Colors.black),
                                backgroundColor:
                                    MaterialStateProperty.all(AppColor.primary),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            child: Text(
                              "Masuk",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 29.h,
                  ),
                  Text(
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal),
                      "Daftar sekarang! dan kumpulkan poin\n sebanyak-banyaknya")
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
