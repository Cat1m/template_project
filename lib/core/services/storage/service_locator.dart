import 'package:get_it/get_it.dart';
import 'package:template_project/core/services/storage/shared_preferences_service.dart';
import 'package:template_project/core/services/storage/storage_service.dart';

final GetIt locator = GetIt.instance;

Future<void> setupServices() async {
  // Đăng ký các services với singleton pattern
  final sharedPrefs = await SharedPreferencesService.getInstance();
  locator.registerSingleton<StorageService>(sharedPrefs);

  // Có thể đăng ký thêm các services khác
  // locator.registerSingleton<ApiService>(ApiService());
  // locator.registerSingleton<AuthService>(AuthService());
}
