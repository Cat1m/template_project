import 'package:flutter/material.dart';
import 'package:template_project/app/app.dart';
import 'package:template_project/core/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const App());
}
