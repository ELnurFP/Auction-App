import 'package:flutter/material.dart';

double getHeight(size, context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double height = screenHeight * size / 812;
  return height;
}

// var width = MediaQuery.of(context).size.width;
double getWidth(size, context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double width = screenWidth * size / 375;
  return width;
}
