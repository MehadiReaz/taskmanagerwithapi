import 'package:get/get.dart';
import 'package:taskmanagerwithapi/ui/state_manager/signup_controller.dart';

import 'ui/state_manager/login_controller.dart';
import 'ui/state_manager/update_profile_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(UpdateProfileController());
    Get.put(SignupController());
  }
}
