abstract class CacheService {
  Future<dynamic> get(String key);
  Future<void> set(String key, dynamic value, Duration duration);
  Future<void> remove(String key);
  Future<void> clear();
}
