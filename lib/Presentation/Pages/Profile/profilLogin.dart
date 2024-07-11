import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Config/theme.dart';
import 'package:posweb/Presentation/Pages/Home/home.dart';

class ProfilLogin extends StatelessWidget {
  const ProfilLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(375, 854),
        child: Scaffold(
          body: Column(
            children: [
              appBarCustom(),
              SizedBox(
                height: 31.h,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Email",
                    style: GoogleFonts.roboto(
                        fontSize: 20.sp, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10.h,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Argibudimanputra@gmail.com",
                    style: GoogleFonts.montserrat(
                        fontSize: 15.sp, fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 20.h,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "No. Telepon",
                    style: GoogleFonts.roboto(
                        fontSize: 20.sp, fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 10.h,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text("089670860363",style: GoogleFonts.montserrat(fontSize: 15.sp,fontWeight: FontWeight.w600),)),
              SizedBox(height: 20.h,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text("Nama",style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold),)),
                SizedBox(height: 10.h,),
                Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text("Argi Budiman Putra",style: GoogleFonts.montserrat(fontSize: 15.sp,fontWeight: FontWeight.w600),)),
            ],
          ),
        ),
      ),
    );
  }
}
