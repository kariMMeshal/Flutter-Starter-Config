import 'package:get_storage/get_storage.dart';

class KLocalStorage {
  KLocalStorage._internal();
  static final KLocalStorage _instance = KLocalStorage._internal();

  factory KLocalStorage() {
    return _instance;
  }

  final _storage = GetStorage();

  Future<void> saveData<K>(String key, K value) async {
    await _storage.write(key, value);
  }

  K? readData<K>(String key) {
    return _storage.read<K>(key);
  }

  Future<void> removeData<K>(String key, K value) async {
    await _storage.remove(key);
  }

  Future<void> clearAll<K>(String key, K value) async {
    await _storage.erase();
  }
}
