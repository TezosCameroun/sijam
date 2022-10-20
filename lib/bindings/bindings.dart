import 'package:get/get.dart';
import 'package:sijam/controller/splash_controller.dart';

import '../view/controllers/controllers.dart';

class StartScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartScreenController());
  }
}

class LauncherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}
