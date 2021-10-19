import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static showSnackBar({String title = '', String content = ''}) {
    Get.snackbar(
      title, content,
      snackPosition: SnackPosition.TOP,
      // titleText: const Text("Other Title"),
      // messageText: const Text("Other Message"),
      colorText: Colors.red,
      backgroundColor: Colors.black,
      borderRadius: 30,
      // borderColor: Colors.white,
      margin: const EdgeInsets.all(5),
      animationDuration: const Duration(seconds: 3),
      // backgroundGradient: const LinearGradient(
      // colors: [Colors.red, Colors.green],
      // ),
      borderWidth: 4,
    );
  }

  static showDialog() {
    Get.defaultDialog(
      title: "Dialog title",
      textCancel: 'cancel',
      textConfirm: 'agree',
      onConfirm: () {
        Get.back();
      },
      onCancel: () {},
      barrierDismissible: false,
    );
  }

  static bool? isEmpty(dynamic value) {
    if (value is String) {
      return value.toString().trim().isEmpty;
    }
    if (value is Iterable || value is Map) {
      return value.isEmpty as bool?;
    }
    return false;
  }

  static bool hasLength(dynamic value) {
    return value is Iterable || value is String || value is Map;
  }

  static bool isNull(dynamic value) {
    return GetUtils.isNull(value);
  }

  static bool? isNullOrBlank(dynamic value) {
    if (isNull(value)) {
      return true;
    }
    return isEmpty(value);
  }

  static bool isBool(dynamic value) {
    if (isNull(value)) {
      return false;
    }
    return (value == 'true' || value == 'false');
  }

  static bool isUsername(String s) => GetUtils.isUsername(s);

  static bool isURL(String s) => GetUtils.isURL(s);

  static isEmail(String email) => GetUtils.isEmail(email);

  static isPhoneNumber(String email) => GetUtils.isPhoneNumber(email);

  static isDateTime(String email) => GetUtils.isDateTime(email);

  static removeAllWhitespace(String value) => GetUtils.removeAllWhitespace(value);

  
}
