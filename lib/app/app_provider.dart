// lib/app/app_provider.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_project/foundation/theme/viewmodels/theme_view_model.dart';
import '../core/di/injection_container.dart'; // Thay đổi import
import '../features/counter/viewmodels/counter_viewmodel.dart';
import '../features/counter/viewmodels/counter_history_viewmodel.dart';
import '../features/counter/viewmodels/counter_stats_viewmodel.dart';
import '../features/todo/viewmodels/todo_viewmodel.dart';

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
        ChangeNotifierProvider(
          create: (_) => getIt<TodoViewModel>(), // Sử dụng sl
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
          create: (_) => getIt<ThemeViewModel>(), // Sử dụng sl thay vì locator
        ),
      ],
      child: child,
    );
  }
}
