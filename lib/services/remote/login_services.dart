// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../config/configs.dart';
import '../../models/login_model/login_model.dart';
import '../../pages/login/fin_coe_page.dart';
import 'fcm_service.dart';

class LoginServices {
  static Future<void> logIn(LoginModel login, BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    try {
      var response = await http.post(Uri.parse(Configs.login),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json'
          },
          body: jsonEncode(login.toJson()));
      log("${response.statusCode}   ${response.body}   login");

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => FinCodePage(
                    phoneNumber: login.phoneNumber,
                    token: response.body,
                    isUpdate: false)));
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      Navigator.pop(context);
      log("${e.toString()} login catched");
    }
  }

  static Future<void> sendPin(
      String pin, String token, BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    try {
      var response = await http.post(Uri.parse(Configs.pinCode),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: "bearer $token"
          },
          body: jsonEncode({"code": pin}));

      if (response.statusCode == 200) {
        final box = GetStorage();
        box.write('token', response.body);

        GetStorage().read('notifyToken') != null
            ? await FCMService.sentFcmToken()
            : null;
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      Navigator.pop(context);
      log("${e.toString()} login catched");
    }
  }
}
