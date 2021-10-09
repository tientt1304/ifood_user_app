import 'package:flutter/material.dart';

class ConfigSize {
  static double? screenWidth;
  static double? screenHeight;
  static Orientation? orientation;
  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
  }
}

double getProportionateScreenHeight(double inputHeight) {
  double? screenHeight = ConfigSize.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight!;
}

double getProportionateScreenWidth(double inputWidth) {
  double? screenWidth = ConfigSize.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth!;
}