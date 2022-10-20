import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sijam/routs/routs.dart';

class HomeController extends GetxController {
  final getStorage = GetStorage();
  var name = "";

  @override
  void onInit() {
    super.onInit();
    name = getStorage.read(name);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  logout() {
    getStorage.erase();
    Get.offAllNamed(RoutesClass.getToLogin());
  }
}
