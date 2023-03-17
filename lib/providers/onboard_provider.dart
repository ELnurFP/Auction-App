import 'package:flutter/material.dart';

class OnboardProvider extends ChangeNotifier {
  final List pages = [
    {
      "title": "Hesaınıza daxil olun",
      "subtitle": "Hesabınıza daxil olmaq üçün\ngöstərilən bəndləri doldurun",
      "image": "assets/images/b1.png"
    },
    {
      "title": "Hesaınıza daxil olun",
      "subtitle": "Hesabınıza daxil olmaq üçün\ngöstərilən bəndləri doldurun",
      "image": "assets/images/b2.png"
    },
    {
      "title": "Hesaınıza daxil olun",
      "subtitle": "Hesabınıza daxil olmaq üçün\ngöstərilən bəndləri doldurun",
      "image": "assets/images/b3.png"
    },
    {
      "title": "Hesaınıza daxil olun",
      "subtitle": "Hesabınıza daxil olmaq üçün\ngöstərilən bəndləri doldurun",
      "image": "assets/images/b4.png"
    },
    {
      "title": "Hesaınıza daxil olun",
      "subtitle": "Hesabınıza daxil olmaq üçün\ngöstərilən bəndləri doldurun",
      "image": "assets/images/b5.png"
    }
  ];

  final PageController _controller = PageController();

  PageController get controller => _controller;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  void changeCurrentPage(int val) {
    _currentPage = val;
    notifyListeners();
  }
  // set setCurrentPage(val) {
  //   _currentPage = val;
  //   notifyListeners();
  // }
}
