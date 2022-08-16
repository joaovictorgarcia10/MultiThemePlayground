import 'package:flutter/material.dart';
import 'package:multi_theme_playground/app_widget.dart';
import 'package:multi_theme_playground/custom_env/custom_env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CustomEnv.load(".env");

  runApp(
    AppWidget(globalTheme: CustomEnv.get("THEME")),
  );
}
