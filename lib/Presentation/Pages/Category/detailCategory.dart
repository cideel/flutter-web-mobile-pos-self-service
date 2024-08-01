import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Config/theme.dart';
import 'package:posweb/Presentation/Controller/AddOrderPopUp/popupController.dart';
import 'package:posweb/Presentation/Pages/Home/Controller/menuController.dart';
import 'package:posweb/Presentation/Pages/Home/Widgets/floatingButton.dart';
import 'package:posweb/Presentation/Pages/PopupAdd/popup.dart';


class DetailCategory extends StatelessWidget {
  final String type;
  final MenuControl menuCon = Get.put(MenuControl());
  final OrderController orderController = Get.put(OrderController());

  DetailCategory({required this.type}) {
    print("DetailCategory initialized with type: $type");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      menuCon.fetchMenuItemsByType(type).then((value) {
        print("Menu items fetched: ${menuCon.menuItems.length}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(375, 854),
        builder: (context, child) => Scaffold(
          body: Obx(() {
            if (menuCon.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            var items = menuCon.menuItems;
            if (items.isEmpty) {
              return Center(
                child: Text(
                  'No items found',
                  style: GoogleFonts.montserrat(
                      fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              );
            }

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                    ),
                  ],
                  floating: false,
                  pinned: true,
                  centerTitle: true,
                  toolbarHeight: 126,
                  title: Container(
                    color: Colors.white,
                    child: Text(
                      type.capitalizeFirst!,
                      style: GoogleFonts.roboto(
                        color: AppColor.primary,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
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
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 25.w,
                      mainAxisSpacing: 27.h,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        var item = items[index];
                        print("Rendering item: ${item['item_name']}");
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
                              ],
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.r),
                                    topRight: Radius.circular(12),
                                  ),
                                  child: Container(
                                    height: 90.h,
                                    width: 1.sw,
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: item['image_url'] ?? 'default_image_url',
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    item['item_name'] ?? 'No name',
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
                                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    item['item_description'] ?? 'No description',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    "Rp. ${item['item_price'] ?? '0'}",
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
                      },
                      childCount: items.length,
                    ),
                  ),
                ),
              ],
            );
          }),
          floatingActionButton: CustomFloatingActionButton(),
        ),
      ),
    );
  }
}
