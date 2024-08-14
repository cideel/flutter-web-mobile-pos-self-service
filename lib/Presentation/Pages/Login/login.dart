import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posweb/Config/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Presentation/Pages/Register/Controller/auth_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    final TextEditingController phoneController = TextEditingController();

    return SafeArea(
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 854),
        child: Scaffold(
          backgroundColor: AppColor.primary,
          appBar: AppBar(
            backgroundColor: AppColor.primary,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios_new)),
          ),
          body: Column(children: [
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "Selamat datang",
                style: GoogleFonts.roboto(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Center(
              child: Text(
                "Masuk untuk mendapatkan diskon",
                style: GoogleFonts.montserrat(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 31.h,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: Colors.white),
                height: 1.sh,
                width: 1.sw,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Masuk",
                      style: GoogleFonts.roboto(
                          fontSize: 32.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "No. Telepon",
                        style: GoogleFonts.roboto(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      width: 335.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(style: BorderStyle.solid, width: 1)),
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            floatingLabelAlignment: FloatingLabelAlignment.center,
                            contentPadding: EdgeInsets.symmetric(horizontal: 26.h),
                            hintText: "Masukkan No.Telepon",
                            hintStyle: GoogleFonts.montserrat(

                                fontSize: 15.sp, fontWeight: FontWeight.w300)),
                      ),
                    ),
                    SizedBox(
                      height: 38.h,
                    ),
                    Container(
                      height: 48.h,
                      width: 335.w,
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (phoneController.text.isEmpty) {
                            Get.snackbar('Error', 'Please enter your phone number.');
                            return;
                          }
                          authController.login(phoneController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Text(
                          "Masuk",
                          style: GoogleFonts.roboto(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Belum punya akun? ",
                          style: GoogleFonts.montserrat(fontSize: 15.sp),
                          children: [
                            TextSpan(
                                text: "Daftar sekarang",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15.sp, color: AppColor.secondary))
                          ]),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
