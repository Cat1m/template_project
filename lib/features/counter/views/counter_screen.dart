import 'package:flutter/material.dart';
import 'package:template_project/core/base/base_screen.dart';
import 'package:template_project/features/counter/viewmodels/counter_viewmodel.dart';
import 'package:template_project/features/counter/views/counter_history_screen.dart';
import 'package:template_project/features/counter/views/counter_stats_screen.dart';
import 'package:template_project/features/theme/widgets/theme_switch.dart';

class CounterScreen extends BaseScreen<CounterViewModel> {
  const CounterScreen({super.key});

  @override
  Widget buildContent(BuildContext context, CounterViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter'),
        actions: [
          ThemeSwitch(),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CounterHistoryScreen(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CounterStatsScreen(),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${viewModel.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.icon(
                  onPressed: viewModel.decrement,
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrease'),
                ),
                const SizedBox(width: 16),
                FilledButton.icon(
                  onPressed: viewModel.increment,
                  icon: const Icon(Icons.add),
                  label: const Text('Increase'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
