// lib/app/app_provider.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template_project/features/theme/viewmodels/theme_view_model.dart';
import '../features/counter/viewmodels/counter_viewmodel.dart';
import '../features/counter/viewmodels/counter_history_viewmodel.dart';
import '../features/counter/viewmodels/counter_stats_viewmodel.dart';

class AppProvider extends StatelessWidget {
  final Widget child;

  const AppProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterViewModel(),
        ),
        ChangeNotifierProxyProvider<CounterViewModel, CounterHistoryViewModel>(
          create: (context) => CounterHistoryViewModel(
            context.read<CounterViewModel>(),
          ),
          update: (context, counterVM, historyVM) =>
              historyVM ?? CounterHistoryViewModel(counterVM),
        ),
        ChangeNotifierProxyProvider<CounterViewModel, CounterStatsViewModel>(
          create: (context) => CounterStatsViewModel(
            context.read<CounterViewModel>(),
          ),
          update: (context, counterVM, statsVM) =>
              statsVM ?? CounterStatsViewModel(counterVM),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeViewModel(),
        ),
      ],
      child: child,
    );
  }
}
