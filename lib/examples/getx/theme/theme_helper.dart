import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeHelper {
  static changeTheme() {
    // ignore: avoid_print
    print(Get.isDarkMode);
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }
}
