import 'package:get/get.dart';

class Navigation {
  static to(Object page) {
    Get.to(page);
  }

  static toNamed(String page) {
    Get.toNamed(page);
  }

  static back() {
    Get.back();
  }

  static off(Object page) {
    Get.off(page);
  }

  static offAll(Object page) {
    Get.offAll(page);
  }
}
