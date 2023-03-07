// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData =
      MediaQuery.of(context as BuildContext);
  static double screenWidth = MediaQuery.of(context as BuildContext).size.width;
  static double screenHeight =
      MediaQuery.of(context as BuildContext).size.height;
  static double defaultSize = _mediaQueryData.size.height;
  static Orientation orientation = _mediaQueryData.orientation;

  static get context => null;
// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  // ignore: non_constant_identifier_names
  double Width = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 378.0) * Width;
}
