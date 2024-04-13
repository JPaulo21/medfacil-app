import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static final FlutterSecureStorage _localStorage = FlutterSecureStorage();

  static Future<void> add({required String key, required String? value}) async {
    await _localStorage.write(key: key, value: value);
  }

  static Future<String?> getValue({required String key}) async {
    return await _localStorage.read(key: key);
  }
}
