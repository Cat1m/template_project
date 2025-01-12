import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_project/app/app_provider.dart';
import 'package:template_project/features/counter/views/counter_screen.dart';
import 'package:template_project/features/theme/viewmodels/theme_view_model.dart';

//! Đây là nơi chứa các file cấu hình chính của ứng dụng. File app.dart sẽ là widget gốc, định nghĩa theme, routes và các provider chính

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: Consumer<ThemeViewModel>(
        builder: (context, themeVM, child) {
          return MaterialApp(
            title: 'Chien_template_project',
            theme: themeVM.theme,
            home: const CounterScreen(),
          );
        },
      ),
    );
  }
}
