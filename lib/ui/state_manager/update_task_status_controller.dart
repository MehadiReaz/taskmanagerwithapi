import 'package:get/get.dart';
import '../../data/model/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class UpdateTaskStatusController extends GetxController {
  bool _updateTaskInProgress = false;

  bool get updateTaskInProgress => _updateTaskInProgress;

  void getUpdateState() {
    update();
  }

  Future<bool> updateTask(String taskId, String newStatus) async {
    _updateTaskInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.updateTask(taskId, newStatus));
    _updateTaskInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
