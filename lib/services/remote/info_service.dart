import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../config/configs.dart';
import '../../models/info_model/info_model.dart';

class InfoService {
  static Future<InfoModel?> getAllInfo() async {
    try {
      var response = await http.get(
        Uri.parse(Configs.getAllInfo),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "bearer ${GetStorage().read('token')}"
        },
      );
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        return InfoModel.fromJson(decoded);
      }
      return InfoModel(
          pageIndex: 1,
          totalPages: 1,
          totalCount: 1,
          hasNextPage: false,
          hasPreviousPage: false,
          values: []);
    } catch (e) {
      log(e.toString());
    }
    return InfoModel(
        pageIndex: 1,
        totalPages: 1,
        totalCount: 1,
        hasNextPage: false,
        hasPreviousPage: false,
        values: []);
  }
}
