import 'package:get_storage/get_storage.dart';

class StorageHelper {
  static dynamic _storage;

  static getStorage() {
    if (null == _storage) {
      return _storage;
    }
    _storage = GetStorage();
    return _storage;
  }

  static writeToStorage(String key, dynamic value) {
    return getStorage().write(key, value);
  }

  static readFromStorage(String key) {
    return getStorage().read(key);
  }
}
