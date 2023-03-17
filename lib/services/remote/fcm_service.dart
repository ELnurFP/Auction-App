import 'dart:developer';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../config/configs.dart';

class FCMService {
  static Future<void> sentFcmToken() async {
    // print('token: ${GetStorage().read('notifyToken')}');
    try {
      var response = await http.post(
        Uri.parse(
            "${Configs.sendFcmToken}/${GetStorage().read('notifyToken')}"),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "bearer ${GetStorage().read('token')}"
        },
      );

      if (response.statusCode == 200) {
        log("fcm service success");
      }
      log(response.body.toString());
      log(response.statusCode.toString());
    } catch (e) {
      log("${e.toString()} fcm service error");
    }
  }
}
