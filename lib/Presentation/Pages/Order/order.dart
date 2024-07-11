import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Config/theme.dart';
import 'package:posweb/Presentation/Pages/Order/Widgets/buyWidget.dart';

class Order extends StatelessWidget {
  final OrderAppBar orderAppBar = Get.put(OrderAppBar());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(375, 854),
        builder: (context, child) => Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  Obx(() => SliverAppBar(
                        automaticallyImplyLeading: false,
                        leading: IconButton(
                          onPressed: () {
                            // Add your back button action here
                          },
                          icon: Icon(Icons.arrow_back_ios_new),
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              // Add your menu button action here
                            },
                            icon: Icon(Icons.menu),
                          ),
                        ],
                        actionsIconTheme: IconThemeData(),
                        floating: false,
                        pinned: true,
                        centerTitle: true,
                        toolbarHeight: 126,
                        title: Container(
                          color: Colors.white, // Background color for the title
                          child: Text(
                            orderAppBar.title.value,
                            style: GoogleFonts.roboto(
                              color: AppColor.primary,
                              fontSize: 36.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0, // Remove shadow
                        flexibleSpace: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      )),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                width: 335.w,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 180.w,
                                      height: 150.h,
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Seblak Komplit\nSpecial Jumbo",
                                              maxLines: 2,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Seblak super pedas dengan isi ceker kerupuk dan lain-lain",
                                              maxLines: 3,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "RP 6.000",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 40.w),
                                    Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          transformAlignment:
                                              Alignment.topCenter,
                                          height: 80.h,
                                          width: 80.w,
                                          child: Image.asset(
                                            "assets/image-order.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Container(
                                          width: 115.w,
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: null,
                                                icon: Icon(
                                                  Icons.remove,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              Text(
                                                "2",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              IconButton(
                                                onPressed: null,
                                                icon: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                            ],
                          ),
                        );
                      },
                      childCount: 20,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey,width: 0.3)),
                      color: Colors.white,
                      boxShadow: [
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
                  height: 176.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Total Harga:',
                            style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 70.w,
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Image.asset(
                                  "assets/icon-money.png",
                                  width: 27.w,
                                  height: 27.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            '5.000.000',
                            style: GoogleFonts.montserrat(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 48.h,
                        width: 335.w,
                        decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(AppColor.primary)),
                            onPressed: () {},
                            child: Text(
                              "Bayar",
                              style: GoogleFonts.roboto(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 48.h,
                        width: 335.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.primary),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Text(
                              "Kembali",
                              style: GoogleFonts.roboto(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primary),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderAppBar extends GetxController {
  var title = "Pesanan".obs;
}
