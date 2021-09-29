import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/controllers/string_controller.dart';
import '../getx/navigation/navigation.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    final StringController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("${controller.summary}")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: style,
              onPressed: () => Navigation.back(),
              child: const Text('Geri Dön'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => 0,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
