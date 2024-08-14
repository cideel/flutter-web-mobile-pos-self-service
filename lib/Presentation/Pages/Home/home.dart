import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posweb/Config/icon.dart';
import 'package:posweb/Config/router.dart';
import 'package:posweb/Config/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Presentation/Pages/Category/detailCategory.dart';
import 'package:posweb/Presentation/Pages/Home/Controller/menuController.dart';
import 'package:posweb/Presentation/Pages/Home/Widgets/floatingButton.dart';
import 'package:posweb/Presentation/Pages/Home/Widgets/iconCategory.dart';
import 'package:posweb/Presentation/Pages/PopupAdd/popup.dart'; // Pastikan hanya mengimpor dari sini

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuControl menuCon = Get.put(MenuControl());

    return SafeArea(
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: Size(375, 854),
        child: Scaffold(
          body: Obx(() {
            if (menuCon.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 53.h,
                  ),
                  appBarCustom(),
                  SizedBox(
                    height: 26.h,
                  ),
                  Container(
                    height: 231.h,
                    width: 332.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/iklan-r.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 210.w,
                    width: 1.sw,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Get.to(() => DetailCategory(type: 'appetizer')),
                              child: iconCategoryWidget(
                                imagePath: IconCategory.iconDrink,
                                text: 'Appetizer',
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(MyPage.category,arguments: {'type':'dessert'}),
                              child: iconCategoryWidget(
                                  imagePath: IconCategory.iconCamilan,
                                  text: "Dessert"),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(MyPage.category,arguments: {'type':'main_course'}),
                              child: iconCategoryWidget(
                                  imagePath: IconCategory.iconNasi, text: "Nasi"),
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(MyPage.category,arguments: {'type':'drink'}),
                              child: iconCategoryWidget(
                                  imagePath: IconCategory.iconBuah, text: "Drink"),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            iconCategoryWidget(
                              imagePath: IconCategory.iconMie,
                              text: 'Mie',
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            iconCategoryWidget(
                                imagePath: IconCategory.iconLauk, text: "Lauk"),
                            SizedBox(
                              width: 5.w,
                            ),
                            iconCategoryWidget(
                                imagePath: IconCategory.iconDoritos,
                                text: "Camilan"),
                            SizedBox(
                              width: 5.h,
                            ),
                            iconCategoryWidget(
                                imagePath: IconCategory.iconSayuran,
                                text: "Sayuran")
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          indent: 5.w,
                          endIndent: 5.w,
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.5),
                          child: Center(
                            child: Text(
                              "Menu Favorit",
                              style: GoogleFonts.roboto(
                                  fontSize: 24.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          indent: 5.w,
                          endIndent: 5.w,
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 25.w,
                            mainAxisSpacing: 27.h,
                          ),
                          itemCount: menuCon.menuItems.length,
                          itemBuilder: (context, index) {
                            var item = menuCon.menuItems[index];
                            return GestureDetector(
                              onTap: () => Get.dialog(AddOrderPopup(item: item)),
                              child: Container(
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
                                          fit: BoxFit.cover,
                                          'assets/product-image-3.png'
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
                                      alignment: Alignment.bottomLeft,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10.w),
                                      child: Text(
                                        item['item_name'],
                                        maxLines: 1,
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
                                      alignment: Alignment.bottomLeft,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10.w),
                                      child: Text(
                                        item['item_description'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10.w),
                                      child: Text(
                                        "Rp. ${item['item_price']}",
                                        maxLines: 1,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            );
          }),
          floatingActionButton: CustomFloatingActionButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}

class appBarCustom extends StatelessWidget {
  const appBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 42.h,
      width: 335.w,
      child: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "POS",
          style: GoogleFonts.roboto(
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.primary),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
    );
  }
}
