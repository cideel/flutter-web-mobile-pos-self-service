import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Config/router.dart';
import 'package:posweb/Config/theme.dart';
import 'package:posweb/Presentation/Pages/Register/Controller/auth_controller.dart';
import 'package:flutter/gestures.dart';

class Register extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                "Bergabunglah\ndengan kami",
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
                "Buat akun untuk mendapatkan diskon",
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Daftar",
                        style: GoogleFonts.roboto(
                            fontSize: 32.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      _buildInputField(
                        "Nama", 
                        nameController, 
                        "Masukkan Nama anda"
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      _buildInputField(
                        "No. Telepon", 
                        phoneController, 
                        "Masukkan No.Telepon"
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      _buildInputField(
                        "Email (Opsional)", 
                        emailController, 
                        "Masukkan Email Anda"
                      ),
                      SizedBox(
                        height: 52.h,
                      ),
                      Obx(() => authController.isLoading.value
                          ? CircularProgressIndicator()
                          : Container(
                              height: 48.h,
                              width: 335.w,
                              decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_validateInput()) {
                                    authController.register(
                                      nameController.text,
                                      phoneController.text,
                                      emailController.text,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Text(
                                  "Daftar",
                                  style: GoogleFonts.roboto(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                      SizedBox(
                        height: 30.h,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Sudah punya akun? ",
                          style: GoogleFonts.montserrat(fontSize: 15.sp),
                          children: [
                            TextSpan(
                              text: "Masuk",
                              style: GoogleFonts.montserrat(
                                fontSize: 15.sp,
                                color: AppColor.secondary,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(MyPage.login);
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _buildInputField(
      String label, TextEditingController controller, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            label,
            style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
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
              border: Border.all(style: BorderStyle.solid, width: 1)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    left: 15.w, bottom: 13.h, top: 13.h),
                hintText: hintText,
                hintStyle: GoogleFonts.montserrat(
                    fontSize: 15.sp, fontWeight: FontWeight.w300)),
          ),
        ),
      ],
    );
  }

  bool _validateInput() {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all required fields');
      return false;
    }
    return true;
  }
}
