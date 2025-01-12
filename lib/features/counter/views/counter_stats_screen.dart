// lib/features/counter/views/counter_stats_screen.dart
import 'package:flutter/material.dart';
import 'package:template_project/core/base/base_screen.dart';
import 'package:template_project/features/counter/viewmodels/counter_stats_viewmodel.dart';

class CounterStatsScreen extends BaseScreen<CounterStatsViewModel> {
  const CounterStatsScreen({super.key});
  @override
  Widget buildContent(BuildContext context, CounterStatsViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Average Value: ${viewModel.averageValue.toStringAsFixed(2)}'),
            Text('Maximum Value: ${viewModel.maxValue}'),
            const SizedBox(height: 16),
            const Text('Value Frequency:'),
            Expanded(
              child: ListView(
                children: viewModel.valueFrequency.entries.map((entry) {
                  return ListTile(
                    title: Text('Value ${entry.key}'),
                    trailing: Text('${entry.value} times'),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
