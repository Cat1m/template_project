// lib/features/theme/viewmodels/theme_view_model.dart
import 'package:flutter/material.dart';
import 'package:template_project/core/base/base_view_model.dart';
import 'package:template_project/core/constants/storage_keys.dart';
import 'package:template_project/core/services/storage/service_locator.dart';
import 'package:template_project/core/services/storage/storage_service.dart';
import 'package:template_project/features/theme/models/app_theme.dart';

// lib/features/theme/viewmodels/theme_view_model.dart
// lib/features/theme/viewmodels/theme_view_model.dart
class ThemeViewModel extends BaseViewModel {
  final StorageService _storage;
  ThemeType _currentTheme;

  ThemeViewModel()
      : _storage = locator<StorageService>(),
        _currentTheme = ThemeType.light {
    _currentTheme = _loadThemeSync(); // Load đồng bộ ngay khi khởi tạo
  }

  // Add getters
  ThemeType get currentTheme => _currentTheme;
  bool get isDarkMode => _currentTheme == ThemeType.dark;
  ThemeData get theme =>
      _currentTheme == ThemeType.light ? AppTheme.light : AppTheme.dark;

  // Load theme đồng bộ
  ThemeType _loadThemeSync() {
    try {
      final savedTheme = _storage.getString(StorageKeys.theme);
      return ThemeType.values.firstWhere(
        (e) => e.toString() == savedTheme,
        orElse: () => ThemeType.light,
      );
    } catch (e) {
      setError('Failed to load theme preference');
    }
    return ThemeType.light;
  }

  Future<void> toggleTheme() async {
    try {
      _currentTheme = isDarkMode ? ThemeType.light : ThemeType.dark;
      await _storage.setString(StorageKeys.theme, _currentTheme.toString());
      notifyListeners();
    } catch (e) {
      setError('Failed to save theme preference');
    }
  }
}
