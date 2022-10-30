import 'package:get/get.dart';
import 'package:sijam/bindings/bindings.dart';
import 'package:sijam/home/home.dart';
import 'package:sijam/view/auth/signin/loging.dart';
import 'package:sijam/view/auth/signin/new_login.dart';
import 'package:sijam/view/auth/signup/create_accout.dart';
import 'package:sijam/view/auth/signup/email_create_account.dart';
import 'package:sijam/view/auth/signup/email_verification.dart';
import 'package:sijam/view/auth/signup/signup.dart';
import 'package:sijam/view/auth/signup/verified_email_successful.dart';
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
  static String createAccount = "/createAccount";
  static String emailcreateAccount = "/emailcreateAccount";
  static String confirmEmailSignUp = "/ConfirmEmailSignUp";
  static String successEmailSignUp = "/successEmailSignUp";
  static String getStartRoute() => start;
  static String getRegisterRoure() => register;
  static String getVerify() => verifyid;
  static String getkyc() => getKyc;
  static String getHome() => home;
  static String getLAunchOne() => launchone;
  static String getToLogin() => newlogin;
  static String getcreateAccount() => createAccount;
  static String getemailcreateAccount() => emailcreateAccount;
  static String getconfirmEmailSignUp() => confirmEmailSignUp;
  static String getsuccessEmailSignUp() => successEmailSignUp;

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
      page: () => const VerifyIdentity(),
      name: verifyid,
    ),
    GetPage(
      page: () => Verify(),
      name: getKyc,
    ),
    GetPage(
      page: () => const Home(),
      name: getKyc,
    ),
    GetPage(
      page: () => SignUpCreateAccount(),
      name: createAccount,
    ),
    GetPage(
      page: () => EmailCreateAccount(),
      name: emailcreateAccount,
    ),
    GetPage(
      page: () => const ConfirmEmailSignUp(),
      name: confirmEmailSignUp,
    ),
    GetPage(
      page: () => const SuccessEmailSignUp(),
      name: successEmailSignUp,
    ),
  ];
}
