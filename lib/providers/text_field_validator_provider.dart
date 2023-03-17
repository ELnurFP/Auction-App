import 'package:flutter/material.dart';

import '../models/login_model/login_model.dart';
import '../services/remote/login_services.dart';

class TextFieldValidation with ChangeNotifier {
  ValidationItem _fin = ValidationItem("", null);
  ValidationItem _phone = ValidationItem("", null);

  ValidationItem get fin => _fin;
  ValidationItem get phone => _phone;

  Color borderColor(bool isPhone) {
    return isPhone
        ? isValidPhone
            ? const Color.fromRGBO(231, 231, 231, 1)
            : Colors.red
        : isValidFin
            ? const Color.fromRGBO(231, 231, 231, 1)
            : Colors.red;
  }

  bool get isValidFin {
    if (_fin.value.isEmpty) return true;
    if (_fin.value.length == 7) return true;

    return false;
  }

  bool get isValidPhone {
    if (_phone.value.isEmpty) return true;
    if (_phone.value.length == 9) return true;

    return false;
  }

  void changeField(String value, bool isPhone) {
    isPhone
        ? _phone = ValidationItem(value, null)
        : _fin = ValidationItem(value, null);
    //    _fin = ValidationItem("null", "Must be at least 3 characters");
    notifyListeners();
  }

  void submitData(BuildContext context) async {
    //Navigator.pushReplacementNamed(context, '/home');
    if ((_fin.value.isNotEmpty && _phone.value.isNotEmpty) &&
        (isValidPhone && isValidFin)) {
      await LoginServices.logIn(
          LoginModel(_fin.value, "994${_phone.value}"), context);
    }
    return null;
  }
}

class ValidationItem {
  final String value;
  final dynamic error;

  ValidationItem(this.value, this.error);
}
