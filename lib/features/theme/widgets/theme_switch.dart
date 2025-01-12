import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_project/features/theme/viewmodels/theme_view_model.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeViewModel>(
      builder: (context, themeVM, _) {
        return IconButton(
          onPressed: themeVM.toggleTheme,
          icon: Icon(
            themeVM.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          ),
          tooltip: 'Toggle theme',
        );
      },
    );
  }
}
