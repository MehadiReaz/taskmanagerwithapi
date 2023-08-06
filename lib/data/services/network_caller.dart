import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:taskmanagerwithapi/data/model/auth_utility.dart';
import 'package:taskmanagerwithapi/data/model/network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(
    String url,
  ) async {
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        return NetworkResponse(
            statusCode: response.statusCode,
            body: jsonDecode(response.body),
            isSuccess: true);
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode, body: null);
      }
    } catch (e) {
      log(e.toString() as num);
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
  }

  Future<NetworkResponse> postRequest(
      String url, Map<String, dynamic> body) async {
    try {
      Response response = await post(Uri.parse(url),
          headers: {
            'content-type': 'application/json',
            'token': AuthUtility.userInfo.token.toString()
          },
          body: jsonEncode(body));

      print(response.statusCode.toString());
      print(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            statusCode: response.statusCode,
            body: jsonDecode(response.body),
            isSuccess: true);
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode, body: null);
      }
    } catch (e) {
      log(e.toString() as num);
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
  }
}
