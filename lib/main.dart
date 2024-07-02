import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:posweb/Config/router.dart';

void main() {
  runApp(const RunApp());
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 854), 
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: MyPage.start,
          getPages: MyPage.pages,
          builder: (context, widget) {
            
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
              ),
              child: widget!,
            );
          },
        );
      },
    );
  }
}
