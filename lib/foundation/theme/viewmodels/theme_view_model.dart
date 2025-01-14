// lib/features/theme/viewmodels/theme_view_model.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/theme_type.dart';
import '../services/theme_storage.dart';

// lib/features/theme/viewmodels/theme_view_model.dart
class ThemeViewModel extends ChangeNotifier {
  final ThemeStorage storage;
  late ThemeType _currentTheme; // Đánh dấu là late

  ThemeViewModel(this.storage) {
    _currentTheme = storage.getTheme(); // Khởi tạo trong constructor
  }

  bool get isDarkMode => _currentTheme == ThemeType.dark;
  ThemeData get theme => isDarkMode ? AppTheme.dark : AppTheme.light;

  Future<void> toggleTheme() async {
    try {
      _currentTheme = isDarkMode ? ThemeType.light : ThemeType.dark;
      await storage.saveTheme(_currentTheme);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Failed to save theme: $e');
      }
    }
  }
}
