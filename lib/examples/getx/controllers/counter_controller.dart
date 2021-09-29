import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 15.obs;
  increment() {
    count++;
  }
}
