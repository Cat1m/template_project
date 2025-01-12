// lib/features/counter/viewmodels/counter_history_viewmodel.dart
import 'package:template_project/core/base/base_view_model.dart';
import 'package:template_project/features/counter/models/counter_action.dart';
import 'package:template_project/features/counter/viewmodels/counter_viewmodel.dart';

class CounterHistoryViewModel extends BaseViewModel {
  CounterViewModel _counterViewModel;

  CounterHistoryViewModel(this._counterViewModel);

  void updateCounterVM(CounterViewModel viewModel) {
    _counterViewModel = viewModel;
    notifyListeners();
  }

  List<CounterAction> get recentActions =>
      _counterViewModel.actions.reversed.take(10).toList();

  int get totalIncrements => _counterViewModel.actions
      .where((action) => action.type == ActionType.increment)
      .length;

  int get totalDecrements => _counterViewModel.actions
      .where((action) => action.type == ActionType.decrement)
      .length;
}
