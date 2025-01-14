// lib/features/networking/services/cache_service_impl.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'cache_service.dart';

class CacheServiceImpl implements CacheService {
  final SharedPreferences _prefs;

  CacheServiceImpl(this._prefs);

  @override
  Future<dynamic> get(String key) async {
    final data = _prefs.getString(key);
    if (data == null) return null;

    final cacheData = json.decode(data);
    final expiryTime =
        DateTime.fromMillisecondsSinceEpoch(cacheData['expiryTime']);

    if (DateTime.now().isAfter(expiryTime)) {
      await remove(key);
      return null;
    }

    return cacheData['value'];
  }

  @override
  Future<void> set(String key, dynamic value, Duration duration) async {
    final data = {
      'value': value,
      'expiryTime': DateTime.now().add(duration).millisecondsSinceEpoch,
    };
    await _prefs.setString(key, json.encode(data));
  }

  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    await _prefs.clear();
  }
}
