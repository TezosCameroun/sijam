import 'package:get/get.dart';

import '../view/controllers/controllers.dart';

class StartScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartScreenController());
  }
}
