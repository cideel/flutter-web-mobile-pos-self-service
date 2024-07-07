import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Config/theme.dart';

class DetailCategory extends StatelessWidget {
  const DetailCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 854),
        builder: (context, child) => Scaffold(
          appBar: PreferredSize(

            preferredSize: Size.fromHeight(55.h),
            child: AppBar(
              
              title: Text(
                "Minuman",
                style: GoogleFonts.roboto(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              
              actions: [
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    // Aksi ketika ikon menu ditekan
                  },
                ),
              ],
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item #$index'),
                    );
                  },
                  childCount: 50, // Jumlah item dalam list
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
