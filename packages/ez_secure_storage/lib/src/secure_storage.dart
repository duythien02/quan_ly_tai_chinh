// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'storage.dart';

class SecureStorage implements Storage {
  const SecureStorage({final FlutterSecureStorage? flutterSecureStorage})
      : _storage = flutterSecureStorage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  @override
  Future<bool> containsKey(final String key) {
    return _storage.containsKey(key: key);
  }

  @override
  Future<void> delete(final String key) {
    return _storage.delete(key: key);
  }

  @override
  Future<String?> read(final String key) {
    return _storage.read(key: key);
  }

  @override
  Future<void> write(final String key, final String value) {
    return _storage.write(key: key, value: value);
  }
}
