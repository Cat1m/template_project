import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  bool _canRetry = false;

  bool get isLoading => _isLoading;

  String? get error => _error;
  bool get canRetry => _canRetry;

  void setLoading() {
    _isLoading = isLoading;
    notifyListeners();
  }

  void setError(String? error, {bool canRetry = false}) {
    _error = error;
    _canRetry = canRetry;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    _canRetry = false;
    notifyListeners();
  }
}
