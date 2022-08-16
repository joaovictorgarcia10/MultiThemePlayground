import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multi_theme_playground/app_widget.dart';
import 'package:multi_theme_playground/custom_env/custom_env.dart';
import 'package:multi_theme_playground/local_theme/models/custom_color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CustomEnv.load(".env");

  Hive.registerAdapter(CustomColorAdapter());
  await Hive.initFlutter();
  await Hive.openBox<CustomColor?>('customColorBox');
  await Hive.openBox<bool>('brightnessBox');

  runApp(
    AppWidget(
      globalTheme: CustomEnv.get("THEME"),
      enviroment: CustomEnv.get("ENV"),
    ),
  );
}
