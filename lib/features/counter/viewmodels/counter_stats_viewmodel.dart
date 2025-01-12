// lib/features/counter/viewmodels/counter_stats_viewmodel.dart
import 'dart:math';

import 'package:template_project/core/base/base_view_model.dart';
import 'package:template_project/features/counter/viewmodels/counter_viewmodel.dart';

class CounterStatsViewModel extends BaseViewModel {
  CounterViewModel _counterViewModel;

  CounterStatsViewModel(this._counterViewModel);

  void updateCounterVM(CounterViewModel viewModel) {
    _counterViewModel = viewModel;
    notifyListeners();
  }

  double get averageValue {
    final actions = _counterViewModel.actions;
    if (actions.isEmpty) return 0;
    return actions.map((a) => a.value).reduce((a, b) => a + b) / actions.length;
  }

  int get maxValue => _counterViewModel.actions.isEmpty
      ? 0
      : _counterViewModel.actions.map((a) => a.value).reduce(max);

  Map<int, int> get valueFrequency {
    return _counterViewModel.actions.fold<Map<int, int>>({}, (freq, action) {
      freq[action.value] = (freq[action.value] ?? 0) + 1;
      return freq;
    });
  }
}
