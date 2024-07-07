import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Config/theme.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ScreenUtilInit(
      designSize:Size(375, 854),
      minTextAdapt: true,
      builder: (context, child) => Scaffold(
        body: Center(child: Text("wkwkwkw"),),
      ),
      
    ),);
  }
}