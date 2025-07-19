import 'package:flutter/material.dart';

class AppDimensions {
  static late double screenHeight;
  static late double screenWidth;
  static late double usableHeight;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    screenHeight = size.height;
    screenWidth = size.width;

    final appBarHeight = kToolbarHeight;

    usableHeight = screenHeight - padding.top - appBarHeight;
  }

  static double height(double percent) => screenHeight * percent;
  static double width(double percent) => screenWidth * percent;

  static double usableHeightPercent(double percent) => usableHeight * percent;
}
