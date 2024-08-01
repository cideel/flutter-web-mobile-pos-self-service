import 'package:get/get.dart';
import 'package:posweb/Presentation/Pages/Category/detailCategory.dart';
import 'package:posweb/Presentation/Pages/DetailHistory/detailOrder.dart';
import 'package:posweb/Presentation/Pages/Dine/dinepage.dart';
import 'package:posweb/Presentation/Pages/History/history.dart';
import 'package:posweb/Presentation/Pages/Home/home.dart';
import 'package:posweb/Presentation/Pages/Login/login.dart';
import 'package:posweb/Presentation/Pages/Order/order.dart';
import 'package:posweb/Presentation/Pages/Payment/payment.dart';
import 'package:posweb/Presentation/Pages/Profile/profilLogin.dart';
import 'package:posweb/Presentation/Pages/Register/register.dart';
import 'package:posweb/Presentation/Pages/Start/start.dart';
import 'package:posweb/main.dart'; // Pastikan untuk mengimpor main.dart

class MyPage {
  static final pages = [
    GetPage(name: start, page: () => StartPage()),
    GetPage(name: register, page: () => Register()),
    GetPage(name: dineConfirm, page: () => DineConfirm()),
    GetPage(name: login, page: () => Login()),
    GetPage(name: home, page: () => MainNavigationPage()), // Menggunakan halaman utama dengan Bottom Navigation
    GetPage(name: category, page: () {
        final arguments = Get.arguments as Map<String, dynamic>;
        return DetailCategory(type: arguments['type']);
      },),
    GetPage(name: history, page: () => History()),
    GetPage(name: profilLogin, page: ()=>ProfilLogin()),
    GetPage(name: order, page:()=>Order()),
    GetPage(name: payment, page: ()=> Payment()),
    GetPage(name: detailOrder, page: ()=>DetailHistory())
  ];

  static getlogin() => StartPage();
  static getRegister() => Register();
  static getDine() => DineConfirm();
  static getLogin() => Login();
  static getHome() => MainNavigationPage(); // Menggunakan halaman utama dengan Bottom Navigation
  static getCategory(String type) => Get.toNamed(category, arguments: {'type': type});
  static getHistory() => History();
  static getProfilLogin()=>ProfilLogin();
  static getOrder()=> Order();
  static getPayment()=> Payment();
  static getDetailOrder ()=> DetailHistory();

  static String start = '/start';
  static String register = '/register';
  static String dineConfirm = '/dineConfirm';
  static String login = '/login';
  static String home = '/home';
  static String category = '/category';
  static String history = '/history';
  static String profilLogin = '/profilLogin';
  static String order = '/order';
  static String payment = '/payment';
  static String detailOrder = '/detaiOrder';
  
}
