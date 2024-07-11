import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:posweb/Config/theme.dart';
import 'package:posweb/Presentation/Controller/NavbarC/navbarController.dart';
import 'package:posweb/Presentation/Pages/Category/detailCategory.dart';
import 'package:posweb/Presentation/Pages/History/history.dart';
import 'package:posweb/Presentation/Pages/Home/home.dart';
import 'package:posweb/Presentation/Pages/Payment/payment.dart';
import 'package:posweb/Presentation/Pages/Profile/profilLogin.dart';
import 'package:posweb/Presentation/Pages/Profile/profile.dart';

import 'config/router.dart';

void main() {
  runApp(const RunApp());
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 854),
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: MyPage.start,
          getPages: MyPage.pages,
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(),
              child: widget!,
            );
          },
        );
      },
    );
  }
}

class MainNavigationPage extends StatelessWidget {
  final BottomNavController bottomNavController = Get.put(BottomNavController());

  final List<Widget> pages = [
    Home(),
    History(),
    ProfilLogin(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: bottomNavController.currentIndex.value,
        children: pages,
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        selectedItemColor: AppColor.primary,
        currentIndex: bottomNavController.currentIndex.value,
        onTap: bottomNavController.changeIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      )),
    );
  }
}
