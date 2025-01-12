abstract class StorageService {
  Future<void> init(); // Khởi tạo service
  Future<void> clear(); // Xóa tất cả data

  // Async methods
  Future<bool> setString(String key, String value);
  Future<bool> setBool(String key, bool value);
  Future<bool> setInt(String key, int value);
  Future<bool> remove(String key);

  // Sync methods
  String? getString(String key); // Không còn async
  bool? getBool(String key); // Không còn async
  int? getInt(String key); // Không còn async
  bool containsKey(String key); // Không còn async
}
