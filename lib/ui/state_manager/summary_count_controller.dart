import 'package:get/get.dart';

import '../../data/model/network_response.dart';
import '../../data/model/summary_count_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class SummaryCountController extends GetxController {
  bool _getCountSummaryInProgress = false;
  SummaryCountModel _summaryCountModel = SummaryCountModel();
  String message = '';

  bool get getCountSummaryInProgress => _getCountSummaryInProgress;

  SummaryCountModel get summaryCountModel => _summaryCountModel;

  Future<bool> getCountSummary() async {
    _getCountSummaryInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.taskStatusCount);
    _getCountSummaryInProgress = false;
    if (response.isSuccess) {
      _summaryCountModel = SummaryCountModel.fromJson(response.body!);
      update();
      return true;
    } else {
      message = 'Count summary get failed! Try again.';
      update();
      return false;
    }
  }
}
