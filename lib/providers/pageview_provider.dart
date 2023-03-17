import 'package:flutter/material.dart';
import 'package:qobustan/services/remote/profile_service.dart';

import '../services/remote/login_services.dart';

class PageViewProvider extends ChangeNotifier {
  final PageController _pageController = PageController();

  PageController get pageController => _pageController;

  void changePage(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    notifyListeners();
  }
}

class PincodeProvider extends ChangeNotifier {
  final TextEditingController _pincodeController = TextEditingController();
  bool _timeIsEnd = false;
  bool get timeIsEnd => _timeIsEnd;
  TextEditingController get pincodeController => _pincodeController;

  void editPincodeController(String num) {
    _pincodeController.text.length < 6
        ? _pincodeController.text = '${_pincodeController.text}$num'
        : null;
    notifyListeners();
  }

  void changeTimeStatus() {
    _timeIsEnd = true;
    notifyListeners();
  }

  void deteleSymbol() {
    _pincodeController.text = _pincodeController.text
        .substring(0, _pincodeController.text.length - 1);
    notifyListeners();
  }

  Future sendPinCode(BuildContext context, String pin, String token) async {
    await LoginServices.sendPin(pin, token, context);
  }

  Future updatePhone(BuildContext context, String phone, String pin) async {
    await ProfileService.updateNumber(context, phone, pin);
  }
}
