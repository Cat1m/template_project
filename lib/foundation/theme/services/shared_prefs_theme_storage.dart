// lib/features/theme/services/shared_prefs_theme_storage.dart
import '../../../core/services/storage/storage_service.dart';
import '../models/theme_type.dart';
import 'theme_storage.dart';

// lib/features/theme/services/shared_prefs_theme_storage.dart
class SharedPrefsThemeStorage implements ThemeStorage {
  final StorageService storage;
  // ignore: constant_identifier_names
  static const String THEME_KEY = 'app_theme';

  SharedPrefsThemeStorage(this.storage);

  @override
  Future<void> saveTheme(ThemeType theme) async {
    await storage.setString(THEME_KEY, theme.toString());
  }

  @override
  ThemeType getTheme() {
    final theme = storage.getString(THEME_KEY);
    return theme == ThemeType.dark.toString()
        ? ThemeType.dark
        : ThemeType.light;
  }
}
