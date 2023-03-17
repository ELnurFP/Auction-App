// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../config/configs.dart';
import '../../models/profile_model/profile_model.dart';

class ProfileService {
  static Future<ProfileModel?> getProfile() async {
    try {
      var response = await http
          .get(Uri.parse(Configs.getProfileInfo), headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: "bearer ${GetStorage().read('token')}"
      });
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        return ProfileModel.fromJson(decoded);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<void> sendUpdateNumberSms(BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(Configs.sendUpdateNumberSms),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader:
                "bearer ${GetStorage().read('token')}"
          });
      if (response.statusCode == 200) {}
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> updateNumber(
      BuildContext context, String phoneNumber, String code) async {
    try {
      var response = await http.post(
          Uri.parse('${Configs.updateNumber}/$phoneNumber/$code'),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader:
                "bearer ${GetStorage().read('token')}"
          });
      if (response.statusCode == 200) {
        final box = GetStorage();
        box.write('token', response.body);
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<String?> getInfo(String name) async {
    try {
      var response = await http
          .get(Uri.parse(Configs.info + name), headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
      });

      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
