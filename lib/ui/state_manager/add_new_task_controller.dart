import 'package:get/get.dart';

import '../../data/model/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class AddNewTaskController extends GetxController {
  bool _adNewTaskInProgress = false;

  bool get adNewTaskInProgress => _adNewTaskInProgress;

  Future<bool> addNewTask(String title, String description) async {
    _adNewTaskInProgress = true;
    update();
    Map<String, dynamic> requestBody = {
      "title": title,
      "description": description,
      "status": "New"
    };
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.createTask, requestBody);
    _adNewTaskInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
