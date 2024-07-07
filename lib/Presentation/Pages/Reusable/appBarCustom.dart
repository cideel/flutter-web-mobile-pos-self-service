
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:posweb/Config/router.dart';
import 'package:posweb/Config/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class appBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const appBarCustom({
    required this.judul,
    super.key,
  });

  final String judul;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        judul,
        style: GoogleFonts.roboto(
            fontSize: 36.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.primary),
      ),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(42.h);
}
