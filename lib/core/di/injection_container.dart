// lib/core/di/injection_container.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../foundation/networking/api/api_service.dart';
import '../../foundation/networking/services/cache_service.dart';
import '../../foundation/networking/services/cache_service_impl.dart';
import '../../foundation/networking/services/connectivity_service.dart';
import '../../foundation/networking/services/network_service.dart';
import '../../foundation/networking/services/network_service_impl.dart';
import '../../foundation/networking/viewmodels/network_view_model.dart';
import '../../foundation/theme/services/shared_prefs_theme_storage.dart';
import '../../foundation/theme/services/theme_storage.dart';
import '../../foundation/theme/viewmodels/theme_view_model.dart';
import '../../data/repositories/todo_repository.dart';
import '../../features/todo/viewmodels/todo_viewmodel.dart';
import '../services/storage/shared_preferences_service.dart';
import '../services/storage/storage_service.dart';

// lib/core/di/injection_container.dart
final GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  await _initCore();
  await _initFeatures();
}

Future<void> _initCore() async {
  // Core services
  await _initStorage();
  await _initNetwork();
}

Future<void> _initFeatures() async {
  _initTheme();
  _initTodo();
  // Thêm các feature khác
}

// Khởi tạo storage core service
Future<void> _initStorage() async {
  final sharedPrefs = await SharedPreferencesService.getInstance();
  getIt.registerSingleton<StorageService>(sharedPrefs);
  // Register SharedPreferences instance để các service khác có thể sử dụng
  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}

Future<void> _initNetwork() async {
  // Setup Dio
  final dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  dio.interceptors.addAll([
    LogInterceptor(
      requestBody: true,
      responseBody: true,
    ),
  ]);

  // Register ApiService
  getIt.registerLazySingleton(() => ApiService(dio));

  // Register other services - sử dụng SharedPreferences đã được register
  getIt.registerLazySingleton<CacheService>(
    () => CacheServiceImpl(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<ConnectivityService>(
    () => ConnectivityServiceImpl(InternetConnectionChecker()),
  );

  getIt.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(
      cacheService: getIt<CacheService>(),
      getToken: () async => getIt<StorageService>().getString('auth_token'),
      refreshToken: () async {
        // Implement your token refresh logic here
        return null;
      },
      onUnauthorized: () {
        // Handle unauthorized access (e.g., logout)
      },
    ),
  );

  getIt.registerFactory(
    () => NetworkViewModel(
      getIt<NetworkService>(),
      getIt<ConnectivityService>(),
    ),
  );
}

Future<void> _initTheme() async {
  getIt.registerLazySingleton<ThemeStorage>(
      () => SharedPrefsThemeStorage(getIt<StorageService>()));
  getIt.registerLazySingleton<ThemeViewModel>(
      () => ThemeViewModel(getIt<ThemeStorage>()));
}

Future<void> _initTodo() async {
  getIt.registerFactory(() => TodoRepository(getIt<ApiService>()));
  getIt.registerFactory(() => TodoViewModel(getIt<TodoRepository>()));
}
