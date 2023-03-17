import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/profile_model/profile_model.dart';
import '../services/remote/profile_service.dart';
import '../utils/routes.dart';

class ProfileProvider extends ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();
  late ProfileModel? _profileModel;
  bool loading = false;
  ProfileModel? get profileModel => _profileModel;
  bool isEdited = false;
  late Uint8List bytes;
  bool _hasConnection = false;
  bool get hasConnection => _hasConnection;

  void changeEdit() {
    isEdited = !isEdited;
    notifyListeners();
  }

  getProfileInfo(BuildContext context) async {
    _hasConnection = await InternetConnectionChecker().hasConnection;
    if (_hasConnection) {
      _profileModel = await ProfileService.getProfile();
      loading = true;
      bytes = const Base64Decoder().convert(_profileModel!.userPhotoBase64!);
    } else {
      Navigator.pushReplacementNamed(context, Routes.noInternet);
    }

    notifyListeners();
  }

  String remove994(String number) {
    String text = number.substring(3);
    return text;
  }

  Future<String?> getInfo(String name) async {
    final request = await ProfileService.getInfo(name);
    return request;
  }
}

class PhoneEditProvider extends ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();

  bool isEdited = false;
  void changeEdit() {
    isEdited = !isEdited;
    notifyListeners();
  }
}
