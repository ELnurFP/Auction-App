import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../config/configs.dart';
import '../../models/auksion_model/auction_model.dart';

class AuctionServices {
  static Future<AuctionModels?> getAllAuctions() async {
    try {
      var response = await http.get(
        Uri.parse(Configs.allAuction),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "bearer ${GetStorage().read("token")}"
        },
      );
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        log(response.body);
        return AuctionModels.fromJson(decoded);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<AuctionLotModel?> getAllLots(String id) async {
    try {
      var response = await http.get(
        Uri.parse("${Configs.getAuctionLots}?AuctionId=$id"),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "bearer ${GetStorage().read("token")}"
        },
      );

      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        return AuctionLotModel.fromJson(decoded);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future joinAuction(String id) async {
    try {
      var response = await http.post(
        Uri.parse("${Configs.joinAuction}?AuctionId=$id"),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "bearer ${GetStorage().read('token')}"
        },
      );
      log(response.statusCode.toString());
      await FirebaseMessaging.instance.subscribeToTopic(id);
      // print(response.body);

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log("${e.toString()} join auction  catched");
    }
  }

  static Future startAuction(String id) async {
    try {
      var response = await http.post(
        Uri.parse("${Configs.startAuction}$id"),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "bearer ${GetStorage().read('token')}"
        },
      );
      //print(json.decode(response.body)["message"]);

      if (response.statusCode == 200) {
        return StartAuctionModel.fromJson(json.decode(response.body));
      }
      return json.decode(response.body)["message"];
    } catch (e) {
      log("${e.toString()} start auction  catched");
    }
    return "null";
  }

  static Future getUserStatus(BuildContext context, String id) async {
    try {
      var response = await http.get(
        Uri.parse("${Configs.getUserStatus}/$id"),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "bearer ${GetStorage().read('token')}"
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      }

      return 'null';
    } catch (e) {
      log(e.toString());
    }
  }
}
