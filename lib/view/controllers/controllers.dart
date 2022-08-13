import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StartScreenController extends GetxController {
  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String? validator(value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }
}
