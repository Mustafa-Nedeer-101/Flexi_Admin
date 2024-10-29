import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class LocalStorage {
  Future<void> storeString(String key, String value);
  Future<String?> fetchString(String key);
  Future<void> storeInt(String key, int value);
  Future<int?> fetchInt(String key);
  Future<void> storeBool(String key, bool value);
  Future<bool?> fetchBool(String key);
  Future<void> storeDouble(String key, double value);
  Future<double?> fetchDouble(String key);
  Future<void> removeData(String key);
  Future<void> clearData();
  Future<bool> containsKey(String key);
}

// FlutterSecureStorage
class FlutterSecureStorageImp implements LocalStorage {
  final FlutterSecureStorage storage;

  FlutterSecureStorageImp({required this.storage});

  @override
  Future<void> storeString(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  @override
  Future<String?> fetchString(String key) async {
    return await storage.read(key: key);
  }

  @override
  Future<void> storeInt(String key, int value) async {
    await storage.write(key: key, value: value.toString());
  }

  @override
  Future<int?> fetchInt(String key) async {
    final value = await storage.read(key: key);
    return value != null ? int.tryParse(value) : null;
  }

  @override
  Future<void> storeBool(String key, bool value) async {
    await storage.write(key: key, value: value.toString());
  }

  @override
  Future<bool?> fetchBool(String key) async {
    final value = await storage.read(key: key);
    return value != null ? value.toLowerCase() == 'true' : null;
  }

  @override
  Future<void> storeDouble(String key, double value) async {
    await storage.write(key: key, value: value.toString());
  }

  @override
  Future<double?> fetchDouble(String key) async {
    final value = await storage.read(key: key);
    return value != null ? double.tryParse(value) : null;
  }

  @override
  Future<void> removeData(String key) async {
    await storage.delete(key: key);
  }

  @override
  Future<void> clearData() async {
    await storage.deleteAll();
  }

  @override
  Future<bool> containsKey(String key) async {
    return await storage.containsKey(key: key);
  }
}
