import 'package:get/get.dart';
import '../../data/model/auth_utility.dart';
import '../../data/model/login_model.dart';
import '../../data/model/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class UpdateProfileController extends GetxController {
  bool _profileInProgress = false;
  bool get profileInProgress => _profileInProgress;
  Future<bool> updateProfile(
    String firstName,
    String lastName,
    String mobile,
    String password,
  ) async {
    _profileInProgress = true;
    update();
    final Map<String, dynamic> requestBody = {
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "photo": ""
    };
    if (password.isNotEmpty) {
      requestBody['password'] = password;
    }

    final NetworkResponse response = await NetworkCaller()
        .postRequest(Urls.updateProfile, requestBody, isLogin: true);
    _profileInProgress = false;
    update();

    if (response.isSuccess) {
      UserData userData = UserData.fromJson(response.body!);
      await AuthUtility.updateUserInfo(userData);
      return true;
    } else {
      return false;
    }
  }
}
