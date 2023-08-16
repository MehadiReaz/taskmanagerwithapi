import 'package:get/get.dart';

import '../../data/model/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class SignupController extends GetxController {
  bool _signUpInProgress = false;
  bool get signupInProgress => _signUpInProgress;
  Future<bool> userSignup(
    String email,
    String firstName,
    String lsatName,
    String mobile,
    String password,
  ) async {
    _signUpInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.registration, <String, dynamic>{
      "email": email,
      "firstName": firstName,
      "lastName": lsatName,
      "mobile": mobile,
      "password": password,
      "photo": ""
    });

    _signUpInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
