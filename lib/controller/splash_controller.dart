import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sijam/routs/routs.dart';

class SplashScreenController extends GetxController {
  final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorage.read("id") != null) {
      // user will be redirected to the home
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed(RoutesClass.home);
      });
    } else {
      Get.offAllNamed(RoutesClass.getToLogin());
    }
  }

  @override
  void onClose() {}
}
