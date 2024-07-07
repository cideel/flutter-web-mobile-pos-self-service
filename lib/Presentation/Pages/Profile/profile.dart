import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Config/theme.dart';
import 'package:posweb/Presentation/Pages/Home/home.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(375, 854),
        minTextAdapt: true,
        builder: (context, child) => Scaffold(
            body: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            appBarCustom(),
            SizedBox(
              height: 31.h,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Anda belum masuk",
                style: GoogleFonts.roboto(
                    fontSize: 32.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                maxLines: 2,
                textAlign: TextAlign.center,
                "Masuk menggunakan No HP anda\nuntuk mendapatkan diskon!",
                style: GoogleFonts.montserrat(
                    fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 31.h,
            ),
            Container(
              width: 300.w,
              height: 48.h,
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
                  onPressed: () {}, // LOGIC,
                  style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.black),
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.primary),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Text(
                    "Masuk",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(height: 22.h,),
            Container(
              width: 300.w,
              height: 48.h,
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
                  onPressed: () {}, // Logic Daftar,
                  style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.black),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: BorderSide(color: AppColor.primary, width: 2.w),
                          borderRadius: BorderRadius.circular(10)))),
                  child: Text(
                    "Daftar",
                    style: GoogleFonts.roboto(
                        color: AppColor.primary,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        )),
      ),
    );
  }
}
