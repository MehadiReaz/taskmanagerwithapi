import 'package:get/get.dart';

import '../../data/model/auth_utility.dart';
import '../../data/model/login_model.dart';
import '../../data/model/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import '../screens/bottom_nav_bar/bottom_nav_bar.dart';

class LoginController extends GetxController {
  bool _loginInProgress = false;
  bool get loginInProgress => _loginInProgress;
  Future<bool> userLogin(String email, String password) async {
    _loginInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().postRequest(
        Urls.login,
        <String, dynamic>{
          "email": email,
          "password": password,
        },
        isLogin: true);
    _loginInProgress = false;
    update();
    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.body!);
      await AuthUtility.saveUserInfo(loginModel);
      Get.offAll(() => BottomNavBar());
      return true;
    } else {
      return false;
    }
  }
}
