import 'package:get/get.dart';
import 'package:sijam/bindings/bindings.dart';
import 'package:sijam/view/auth/signin/login.dart';
import 'package:sijam/view/auth/signup/register.dart';
import 'package:sijam/view/splash/landing.dart';
import 'package:sijam/view/splash/startscreen.dart';

class RoutesClass {
  static String start = "/start";
  static String getStartRoute() => start;
  static String register = "/register";
  static String login = "/login";
  static String getRegisterRoure() => register;
  static List<GetPage> routes = [
    GetPage(
      page: () => StartScreen(),
      name: start,
      binding: StartScreenBinding(),
    ),
    GetPage(
      page: () => Rgister(),
      name: register,
    ),
    GetPage(
      page: () => Login(),
      name: login,
    )
  ];
}
