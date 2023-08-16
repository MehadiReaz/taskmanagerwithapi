import 'package:get/get.dart';
import 'package:taskmanagerwithapi/ui/state_manager/add_new_task_controller.dart';
import 'package:taskmanagerwithapi/ui/state_manager/delete_task_controller.dart';
import 'package:taskmanagerwithapi/ui/state_manager/email_varification_controller.dart';
import 'package:taskmanagerwithapi/ui/state_manager/get_task_controller.dart';
import 'package:taskmanagerwithapi/ui/state_manager/otp_varification_controller.dart';
import 'package:taskmanagerwithapi/ui/state_manager/reset_password_controller.dart';
import 'package:taskmanagerwithapi/ui/state_manager/signup_controller.dart';
import 'ui/state_manager/bottom_nav_controller.dart';
import 'ui/state_manager/login_controller.dart';
import 'ui/state_manager/summary_count_controller.dart';
import 'ui/state_manager/update_profile_controller.dart';
import 'ui/state_manager/update_task_status_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(OTPVarificationController());
    Get.put(ResetPasswordController());
    Get.put(SignupController());
    Get.put(EmailVarificationController());
    Get.put(AddNewTaskController());
    Get.put(SummaryCountController());
    Get.put(GetTasksController());
    Get.put(DeleteTaskController());
    Get.put(UpdateTaskStatusController());
    Get.put(BottomNavController());
    Get.put(UpdateProfileController());
  }
}
