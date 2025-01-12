// lib/features/counter/viewmodels/counter_viewmodel.dart
import 'package:template_project/core/base/base_view_model.dart';
import 'package:template_project/features/counter/models/counter_action.dart';

class CounterViewModel extends BaseViewModel {
  int _count = 0;
  final List<CounterAction> _actions = [];

  int get count => _count;
  List<CounterAction> get actions => _actions;

  void increment() {
    try {
      _count++;
      _actions.add(
        CounterAction(
          type: ActionType.increment,
          timestamp: DateTime.now(),
          value: _count,
        ),
      );
      notifyListeners();
    } catch (e) {
      setError("Failed to increment counter", canRetry: true);
    }
  }

  void decrement() {
    try {
      if (_count > 0) {
        _count--;
        _actions.add(
          CounterAction(
            type: ActionType.decrement,
            timestamp: DateTime.now(),
            value: _count,
          ),
        );
        notifyListeners();
      }
    } catch (e) {
      setError("Failed to decrement counter", canRetry: true);
    }
  }
}
