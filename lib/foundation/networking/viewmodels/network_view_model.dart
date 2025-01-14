// lib/features/networking/viewmodels/network_view_model.dart

import '../models/network_config/network_config.dart';
import '../services/network_service.dart';
import '../services/connectivity_service.dart';

class NetworkViewModel {
  final NetworkService _networkService;
  final ConnectivityService _connectivityService;

  NetworkViewModel(this._networkService, this._connectivityService);

  Future<void> initialize(NetworkConfig config) async {
    await _networkService.initialize(config);
  }

  Stream<bool> get connectivityStream =>
      _connectivityService.onConnectivityChanged;
}
