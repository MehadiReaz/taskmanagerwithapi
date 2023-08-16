import 'package:get/get.dart';

import '../../data/model/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import 'get_task_controller.dart';

class DeleteTaskController extends GetxController {
  final GetTasksController _getTasksController = Get.find<GetTasksController>();

  Future<bool> deleteTask(String taskId) async {
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.deleteTask(taskId));
    update();
    if (response.isSuccess) {
      _getTasksController.taskListModel.data!
          .removeWhere((element) => element.sId == taskId);
      update();
      return true;
    } else {
      return false;
    }
  }
}
