import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:posweb/Config/theme.dart';
import 'package:posweb/Model/User.dart';
import 'package:posweb/Presentation/Controller/AddOrderPopUp/popupController.dart';
import 'package:posweb/Presentation/Controller/NavbarC/navbarController.dart';
import 'package:posweb/Presentation/Controller/user_controller.dart';
import 'package:posweb/Presentation/Pages/Category/detailCategory.dart';
import 'package:posweb/Presentation/Pages/DetailHistory/detailOrder.dart';
import 'package:posweb/Presentation/Pages/History/history.dart';
import 'package:posweb/Presentation/Pages/Home/home.dart';
import 'package:posweb/Presentation/Pages/Payment/payment.dart';
import 'package:posweb/Presentation/Pages/Profile/profilLogin.dart';
import 'package:posweb/Presentation/Pages/Profile/profile.dart';
import 'package:posweb/Presentation/Pages/Register/Controller/auth_controller.dart';

import 'config/router.dart';

void main() async {
  Get.put(OrderController());
  Get.put(AuthController());
  Get.put(UserController());
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
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

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
      bottomNavigationBar: Obx(() {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(-5, -2), // changes position of shadow
                  ),
                ],
              ),
              child: BottomNavigationBar(
                selectedItemColor: AppColor.primary,
                unselectedItemColor: Colors.grey,
                currentIndex: bottomNavController.currentIndex.value,
                onTap: bottomNavController.changeIndex,
                iconSize: 30.0, // Ukuran ikon diperbesar
                selectedFontSize: 16.0, // Ukuran teks terpilih diperbesar
                unselectedFontSize:
                    14.0, // Ukuran teks tidak terpilih diperbesar
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.history), label: 'Riwayat'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
