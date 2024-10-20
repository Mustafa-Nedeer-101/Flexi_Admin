import 'package:flutter/material.dart';

class UDeviceUtils {
  UDeviceUtils._();

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.paddingOf(context).top;
  }

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double getKeyboardHeight(BuildContext context) {
    final viewInsets = MediaQuery.viewInsetsOf(context);
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisible(BuildContext context) async {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom > 0;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 1200;
  }

  static bool isTabletScreen(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 600;
  }

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 600;
  }
}
