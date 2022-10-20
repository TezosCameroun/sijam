import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sijam/routs/routs.dart';

class LoginController extends GetxController {
  final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  login() {
    getStorage.write("id", 1);
    getStorage.write("name", "sijam");
    Get.offAllNamed(RoutesClass.home);
  }
}
