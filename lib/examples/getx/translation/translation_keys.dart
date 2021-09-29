import 'package:get/get.dart';

class TranslationKeys extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'hello': 'Hello World',
        },
        'de': {
          'hello': 'Hallo Welt',
        },
        'tr': {
          'hello': 'Merhaba!',
        }
      };
}
