import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../config/configs.dart';
import '../../models/histories_model/histories_models.dart';

class HistoryServices {
  static Future<HistoryModels?> getAllHistory() async {
    try {
      var response = await http.get(
        Uri.parse(Configs.getLotHistories),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "bearer ${GetStorage().read('token')}"
        },
      );
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        return HistoryModels.fromJson(decoded);
      }
      return HistoryModels(
          pageIndex: 1,
          totalPages: 1,
          totalCount: 1,
          hasNextPage: false,
          hasPreviousPage: false,
          values: []);
    } catch (e) {
      log("${e.toString()}    history get all catched");
    }
    return HistoryModels(
        pageIndex: 1,
        totalPages: 1,
        totalCount: 1,
        hasNextPage: false,
        hasPreviousPage: false,
        values: []);
  }

  static Future<HistoryModels?> getAllHistoryWin() async {
    try {
      var response = await http.get(
        Uri.parse(Configs.getLotHistoriesWin),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "bearer ${GetStorage().read('token')}"
        },
      );
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        return HistoryModels.fromJson(decoded);
      }
      return HistoryModels(
          pageIndex: 1,
          totalPages: 1,
          totalCount: 1,
          hasNextPage: false,
          hasPreviousPage: false,
          values: []);
    } catch (e) {
      log("${e.toString()}    history get win catched");
    }
    return HistoryModels(
        pageIndex: 1,
        totalPages: 1,
        totalCount: 1,
        hasNextPage: false,
        hasPreviousPage: false,
        values: []);
  }

  static Future<HistoryModels?> getAllHistoryLose() async {
    try {
      var response = await http.get(
        Uri.parse(Configs.getLotHistoriesLose),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "bearer ${GetStorage().read('token')}"
        },
      );
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        return HistoryModels.fromJson(decoded);
      }
      return HistoryModels(
          pageIndex: 1,
          totalPages: 1,
          totalCount: 1,
          hasNextPage: false,
          hasPreviousPage: false,
          values: []);
    } catch (e) {
      log("${e.toString()}    history get lose catched");
    }
    return HistoryModels(
        pageIndex: 1,
        totalPages: 1,
        totalCount: 1,
        hasNextPage: false,
        hasPreviousPage: false,
        values: []);
  }

  static Future<HistoryDeteailed?> getAllHistoryDetailed(String id) async {
    try {
      var response = await http.get(
        Uri.parse("${Configs.getLotHistoryDetailed}$id"),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "bearer ${GetStorage().read('token')}"
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        return HistoryDeteailed.fromJson(decoded);
      }
      return null;
    } catch (e) {
      log("${e.toString()}    history detailed catched");
    }
    return null;
  }
}
