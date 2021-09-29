import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'examples/getx/controllers/counter_controller.dart';
import 'examples/getx/controllers/string_controller.dart';
import 'examples/getx/navigation/navigation.dart';
import 'examples/getx/theme/theme_helper.dart';
import 'examples/getx/translation/translation_keys.dart';
import 'examples/view/screen_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TranslationKeys(),
      locale: const Locale('tr'),
      fallbackLocale: const Locale('tr'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  final String title;

  const _MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    final CounterController counter = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('hello'.tr),
            getText1(),
            getText2(counter, context),
            ElevatedButton(
              style: style,
              onPressed: () => Navigation.to(const Screen2()),
              child: const Text('Sayfa 2 Git'),
            ),
            ElevatedButton(
              style: style,
              onPressed: ThemeHelper.changeTheme,
              child: const Text('Temayı Değiştir'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  dynamic getText1() {
    var controller = Get.put(StringController());
    return Obx(() => Text(controller.summary.value));
  }

  Obx getText2(CounterController counter, BuildContext context) {
    return Obx(
      () => Text(
        '${counter.count}',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
