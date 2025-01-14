// lib/features/theme/services/theme_storage.dart
import 'package:template_project/foundation/theme/models/theme_type.dart';

abstract class ThemeStorage {
  Future<void> saveTheme(ThemeType theme);
  ThemeType
      getTheme(); // sync vì chúng ta cần giá trị ngay lập tức khi khởi tạo app
}
