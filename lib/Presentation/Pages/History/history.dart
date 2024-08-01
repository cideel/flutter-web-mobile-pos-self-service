import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Config/theme.dart';

class History extends StatelessWidget {
  final HistoryTitle historyTitle = Get.put(HistoryTitle());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(375, 854),
        builder: (context, child) => Scaffold(
          body: CustomScrollView(
            slivers: [
              Obx(() => SliverAppBar(
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios_new),
                    ),
                    floating: false,
                    pinned: true,
                    centerTitle: true,
                    toolbarHeight: 126,
                    title: Container(
                      color: Colors.white, // Background color for the title
                      child: Text(
                        historyTitle.title.value,
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
                            height: 31.h,
                          ),
                          Container(
                              
                              width: 335.w,
                              height: 70.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "27 Juni 2024",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        "Meja : 12",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "No Pesanan : 04",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        textAlign: TextAlign.end,
                                        "Cash",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 19.h,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Total Harga :",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Image.asset(
                                            "assets/icon-money.png",
                                            width: 15.w,
                                            height: 15.h,
                                          ),
                                          SizedBox(width: 5.w,),
                                          Text(
                                            "5.000.000",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )),
                              Divider()
                        ],
                      ),
                    );
                  },
                  childCount: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryTitle extends GetxController {
  var title = "Riwayat".obs;
}
