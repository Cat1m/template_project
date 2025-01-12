// lib/features/counter/views/counter_history_screen.dart
import 'package:flutter/material.dart';
import 'package:template_project/core/base/base_screen.dart';
import 'package:template_project/features/counter/models/counter_action.dart';
import 'package:template_project/features/counter/viewmodels/counter_history_viewmodel.dart';

class CounterHistoryScreen extends BaseScreen<CounterHistoryViewModel> {
  const CounterHistoryScreen({super.key});
  @override
  Widget buildContent(BuildContext context, CounterHistoryViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView.builder(
        itemCount: viewModel.recentActions.length,
        itemBuilder: (context, index) {
          final action = viewModel.recentActions[index];
          return ListTile(
            leading: Icon(action.type == ActionType.increment
                ? Icons.arrow_upward
                : Icons.arrow_downward),
            title: Text('Value: ${action.value}'),
            subtitle: Text(
                'Action: ${action.type.name} at ${action.timestamp.toString()}'),
          );
        },
      ),
    );
  }
}
