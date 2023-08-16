import 'package:get/get.dart';

import '../../data/model/auth_utility.dart';
import '../../data/model/login_model.dart';
import '../../data/model/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class UpdateProfileController extends GetxController {
  bool _profileUpdateInProgress = false;

  bool get profileUpdateInProgress => _profileUpdateInProgress;

  void getUpdateState() {
    update();
  }

  Future<bool> updateProfile(
      String firstName, String lastName, String mobile, String password) async {
    _profileUpdateInProgress = true;
    update();
    final Map<String, dynamic> requestBody = {
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "photo": ""
    };
    if (password.isNotEmpty && password.length >= 5) {
      requestBody['password'] = password;
    }

    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.updateProfile, requestBody);
    _profileUpdateInProgress = false;
    update();
    if (response.isSuccess) {
      UserData userData = AuthUtility.userInfo.data!;
      userData.firstName = firstName;
      userData.lastName = lastName;
      userData.mobile = mobile;
      AuthUtility.updateUserInfo(userData);
      return true;
    } else {
      return false;
    }
  }
}
