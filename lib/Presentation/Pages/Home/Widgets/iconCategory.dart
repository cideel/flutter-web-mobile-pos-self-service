import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:posweb/Config/icon.dart';
import 'package:posweb/Config/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class iconCategoryWidget extends StatelessWidget {
  const iconCategoryWidget({
    required this.imagePath,
    required this.text,
    super.key,
    
  });

  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 70.h,
          width: 78.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: AppColor.secondary, width: 1),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                text,
                style: GoogleFonts.montserrat(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          top: -25
              .h, 
          left: 9
              .w, 
          child: Container(
            height: 60.h,
            width: 60.w,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}