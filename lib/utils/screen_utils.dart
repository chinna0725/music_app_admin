import 'package:flutter/material.dart';

class ScreenUtils {
  static bool isMobileView(BuildContext context) {
    return getSize(context).width <= 600;
  }

  static bool isTabletView(BuildContext context) {
    return getSize(context).width > 500 && getSize(context).width <= 1000;
  }

  static Size getSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }
}
