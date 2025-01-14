// lib/core/services/storage/shared_preferences_service.dart
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'storage_service.dart';

class SharedPreferencesService implements StorageService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  // Singleton pattern
  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  @override
  Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  @override
  Future<bool> setString(String key, String value) async {
    if (_preferences == null) await init();
    return await _preferences?.setString(key, value) ?? false;
  }

  @override
  String? getString(String key) {
    return _preferences?.getString(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    if (_preferences == null) await init();
    return await _preferences?.setBool(key, value) ?? false;
  }

  @override
  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    if (_preferences == null) await init();
    return await _preferences?.setInt(key, value) ?? false;
  }

  @override
  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  @override
  Future<bool> remove(String key) async {
    if (_preferences == null) await init();
    return await _preferences?.remove(key) ?? false;
  }

  @override
  bool containsKey(String key) {
    return _preferences?.containsKey(key) ?? false;
  }

  @override
  Future<void> clear() async {
    if (_preferences == null) await init();
    await _preferences?.clear();
  }

  // Có thể thêm các phương thức tiện ích
  Future<bool> setDouble(String key, double value) async {
    if (_preferences == null) await init();
    return await _preferences?.setDouble(key, value) ?? false;
  }

  Future<double?> getDouble(String key) async {
    if (_preferences == null) await init();
    return _preferences?.getDouble(key);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    if (_preferences == null) await init();
    return await _preferences?.setStringList(key, value) ?? false;
  }

  Future<List<String>?> getStringList(String key) async {
    if (_preferences == null) await init();
    return _preferences?.getStringList(key);
  }

  // Tiện ích cho DateTime
  Future<bool> setDateTime(String key, DateTime value) async {
    return await setString(key, value.toIso8601String());
  }

  Future<DateTime?> getDateTime(String key) async {
    final dateStr = getString(key);
    if (dateStr == null) return null;
    return DateTime.tryParse(dateStr);
  }

  // Tiện ích cho JSON
  Future<bool> setJSON(String key, Map<String, dynamic> json) async {
    return await setString(key, jsonEncode(json));
  }

  Future<Map<String, dynamic>?> getJSON(String key) async {
    final jsonStr = getString(key);
    if (jsonStr == null) return null;
    return jsonDecode(jsonStr) as Map<String, dynamic>;
  }
}
