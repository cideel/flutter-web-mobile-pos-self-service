import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Config/theme.dart';
import 'package:posweb/Presentation/Pages/Home/home.dart';
import 'package:posweb/Presentation/Pages/Payment/Controller/switchController.dart';
import 'package:posweb/Presentation/Pages/Reusable/appBar.dart';
import 'package:posweb/Presentation/PopupPoint/popupPoint.dart';

class Payment extends StatelessWidget {
  final SwitchController switchController = Get.put(SwitchController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(375, 854),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                BarCustom(judul: "Pembayaran"),
                SizedBox(
                  height: 31.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Take Away",
                    style: GoogleFonts.roboto(
                        fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 31.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "*  Masukkan Nomor HP untuk Gunakan Poin",
                    style: GoogleFonts.montserrat(
                        fontSize: 13.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 31.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 48.h,
                  width: 335.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                        hintText: "Masukkan No. HP anda",
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 15.sp, fontWeight: FontWeight.w300)),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: 335.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: ElevatedButton(
                      onPressed: null,
                      child: Text(
                        "Cek Nomor HP",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 37.w,
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: AppColor.primary,
                      ),
                      iconSize: 25.w,
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text(
                      "Daftarkan Nomor HP",
                      style: GoogleFonts.montserrat(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColor.primary),
                    ),
                  ],
                ),
                SizedBox(
                  height: 34.h,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.1,
                ),
                SizedBox(
                  height: 31.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/coin.png",
                                height: 13.h,
                                width: 18.w,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Pakai poin mu",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Cek nomor HP dulu",
                            style: GoogleFonts.montserrat(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primary),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 135.w,
                      ),
                      Obx(() => Transform.scale(
                            scale: 1,
                            child: Switch(
                                activeColor: AppColor.primary,
                                value: switchController.isSwitched.value,
                                onChanged: (value) {
                                  switchController.toggleSwitch(value);
                                }),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 21.h,
                ),
                Container(
                  width: 1.sw,
                  height: 123.h,
                  color: Color(0xFFEBEBEB),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 22.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Total yang harus dibayarkan",
                          style: GoogleFonts.montserrat(
                              fontSize: 13.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Rp.110.000",
                          style: GoogleFonts.montserrat(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 28.5.w),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pilih Metode pembayaran :",
                    style: GoogleFonts.roboto(
                        fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/cash-icon.png',
                            width: 38.w,
                            height: 38.h,
                          ),
                          Text(
                            "Cash",
                            style: GoogleFonts.roboto(
                                fontSize: 10.sp,
                                color: Color(0xffC4C4C4),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      width: 82.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Color(0xffC4C4C4))),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 82.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Color(0xffC4C4C4))),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 82.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Color(0xffC4C4C4))),
                    )
                  ],
                ),
                SizedBox(
                  height: 31.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  width: 335.w,
                  height: 48.h,
                  child: ElevatedButton(
                      onPressed: null,
                      child: Text(
                        "Lanjutkan",
                        style: GoogleFonts.roboto(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(10.r)),
                ),
                SizedBox(
                  height: 31.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  width: 335.w,
                  height: 48.h,
                  child: ElevatedButton(
                     
                      onPressed: (){
                        showCustomDialog();
                      },
                      child: Text(
                        "Kembali",
                        style: GoogleFonts.roboto(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary),
                      )),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColor.primary),
                      borderRadius: BorderRadius.circular(10.r)),
                ),
                SizedBox(height: 40.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
