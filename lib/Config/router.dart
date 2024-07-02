import 'package:get/get.dart';
import 'package:posweb/Presentation/Pages/Dine/dinepage.dart';
import 'package:posweb/Presentation/Pages/Home/home.dart';
import 'package:posweb/Presentation/Pages/Login/login.dart';
import 'package:posweb/Presentation/Pages/Register/register.dart';
import 'package:posweb/Presentation/Pages/Start/start.dart';

class MyPage{
  static final pages = [
    GetPage(name: start, page: ()=> StartPage()),
    GetPage(name: register, page: ()=>Register()),
    GetPage(name: dineConfirm, page: ()=>DineConfirm()),
    GetPage(name: login, page: ()=>Login()),
    GetPage(name: home, page: ()=>Home())
  ];

  static getlogin()=> StartPage();
  static getRegister ()=> Register();
  static getDine ()=> DineConfirm();
  static getLogin ()=>Login();
  static getHome ()=> Home();

  static String start = '/start';
  static String register = '/register';
  static String dineConfirm = '/dineConfirm';
  static String login = '/login';
  static String home = '/home';


}