import 'package:flutter/material.dart';
import 'package:template_project/app/app.dart';
import 'package:template_project/core/services/storage/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServices();
  runApp(const App());
}
