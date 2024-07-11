import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Config/theme.dart';

class DetailCategory extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

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
                        homeController.title.value,
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
                        Container(
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 25.w,
                                mainAxisSpacing: 27.h,
                              ),
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 169.h,
                                  width: 154.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.25),
                                          spreadRadius: 0,
                                          offset: Offset(3, 3),
                                          blurRadius: 5,
                                        ),
                                      ]),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12.r),
                                            topRight: Radius.circular(12)),
                                        child: Container(
                                          height: 90.h,
                                          width: 1.sw,
                                          child: Image.asset(
                                            "assets/product-image-3.png",
                                            fit: BoxFit.cover,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.r)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 10.w),
                                        child: Text(
                                          "Saladin Al Ayubi Menyehatkan Masa ya yang bener loe",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                                        child: Text(
                                          maxLines: 1,
                                          "Rp.6000",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
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

class HomeController extends GetxController {
  var title = "Minuman".obs;
}
