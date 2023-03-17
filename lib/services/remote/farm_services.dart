import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../config/configs.dart';
import '../../models/farm_model/farm_model.dart';
import '../../models/farm_model/live_stock_model.dart';

class FarmService {
  static Future<FarmModels?> getAllFarms(FarmPostModel farmPostModel) async {
    try {
      var response = await http.post(Uri.parse(Configs.allFarm),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(farmPostModel.toJson()));
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        return FarmModels.fromJson(decoded);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<List<dynamic>> getFarmPurpose() async {
    try {
      var response = await http.get(
        Uri.parse(Configs.allFarmPurpose),
      );
      if (response.statusCode == 200) {
        List<dynamic> decoded = json.decode(response.body);

        return decoded;
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  static Future<LiveStockModels?> getAllLiveStock(String id) async {
    try {
      var response = await http.get(
        Uri.parse("${Configs.allLiveStock}?FarmId=$id"),
      );
      if (response.statusCode == 200) {
        LiveStockModels decoded =
            LiveStockModels.fromJson(json.decode(response.body));
        return decoded;
      }
    } catch (e) {
      log("${e.toString()}   getAllLiveStock ");
    }
    return null;
  }

  static Future<LiveStockDetailed?> detailedLiveStock(String id) async {
    try {
      var response = await http.get(
        Uri.parse("${Configs.detailedLiveStock}?id=$id"),
      );
      if (response.statusCode == 200) {
        log("${response.body}      detailed livestock");
        LiveStockDetailed decoded =
            LiveStockDetailed.fromJson(json.decode(response.body));
        return decoded;
      }
    } catch (e) {
      log("${e.toString()}     detailedLiveStock");
    }
    return null;
  }
}
