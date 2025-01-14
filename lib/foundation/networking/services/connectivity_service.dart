// lib/features/networking/services/connectivity_service.dart
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ConnectivityService {
  Future<bool> get isConnected;
  Stream<bool> get onConnectivityChanged;
}

class ConnectivityServiceImpl implements ConnectivityService {
  final InternetConnectionChecker _connectionChecker;

  ConnectivityServiceImpl(this._connectionChecker);

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;

  @override
  Stream<bool> get onConnectivityChanged => _connectionChecker.onStatusChange
      .map((status) => status == InternetConnectionStatus.connected);
}
