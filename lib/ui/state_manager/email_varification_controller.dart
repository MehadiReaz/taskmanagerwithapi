import 'package:get/get.dart';
import '../../data/model/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class EmailVarificationController extends GetxController {
  bool _emailVerficatinInProgress = false;
  bool get emailVerficatinInProgress => _emailVerficatinInProgress;
  Future<bool> sendOTPToEmail(String email) async {
    _emailVerficatinInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.sendOtpToEmail(email));
    _emailVerficatinInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
