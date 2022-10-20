import 'package:get/get.dart';
import 'package:sijam/bindings/bindings.dart';
import 'package:sijam/home/home.dart';
import 'package:sijam/view/auth/signin/loging.dart';
import 'package:sijam/view/auth/signin/new_login.dart';
import 'package:sijam/view/auth/signup/signup.dart';
import 'package:sijam/view/kyc/verification.dart';
import 'package:sijam/view/kyc/verify_identity.dart';
import 'package:sijam/view/splash/launch1.dart';
import 'package:sijam/view/splash/startscreen.dart';

class RoutesClass {
  static String launchone = "/launchOne";
  static String start = "/start";
  static String home = "/home";
  static String getKyc = "/kycpage";
  static String register = "/register";
  static String newlogin = "/NewLogin";
  static String verifyid = "/verify";
  static String getStartRoute() => start;
  static String getRegisterRoure() => register;
  static String getVerify() => verifyid;
  static String getkyc() => getKyc;
  static String getHome() => home;
  static String getLAunchOne() => launchone;
  static String getToLogin() => newlogin;

  static List<GetPage> routes = [
    GetPage(
        page: () => LaunchScreenone(),
        name: launchone,
        binding: LauncherBinding()
        // binding: StartScreenBinding(),
        ),
    GetPage(
      page: () => StartScreen(),
      name: start,
      binding: StartScreenBinding(),
    ),
    GetPage(
      page: () => NewLogin(),
      name: newlogin,
    ),
    GetPage(
      page: () => SignUp(),
      name: register,
    ),
    GetPage(
      page: () => VerifyIdentity(),
      name: verifyid,
    ),
    GetPage(
      page: () => Verify(),
      name: getKyc,
    ),
    GetPage(
      page: () => Home(),
      name: getKyc,
    ),
  ];
}
