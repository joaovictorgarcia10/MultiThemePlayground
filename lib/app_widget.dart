import 'package:flutter/material.dart';
import 'package:flutter_atomic_design/exports/tokens.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multi_theme_playground/local_theme/local_theme.dart';
import 'package:multi_theme_playground/pages/change_theme_page.dart';
import 'package:multi_theme_playground/pages/home_page.dart';

import 'local_theme/models/custom_color.dart';

class AppWidget extends StatelessWidget {
  final String globalTheme;
  final String enviroment;

  const AppWidget({
    Key? key,
    required this.globalTheme,
    required this.enviroment,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Global Theme: $globalTheme");
    print("Enviroment: $enviroment");

    // Sets the GlobalTheme from Design System using de .env build settings
    MTheme.t(theme: globalTheme);

    // Gets the LocalTheme Colors and Brightness from Local Storage
    final customColorBox = Hive.box<CustomColor?>("customColorBox");
    final brightnessBox = Hive.box<bool>("brightnessBox");

    ThemeData themeData = ThemeData();
    LocalTheme localTheme = LocalTheme.instance;

    return AnimatedBuilder(
      animation: localTheme,
      builder: (_, __) {
        // Theme Settings Variables
        var primary = (customColorBox.get("primary") != null)
            ? Color(customColorBox.get("primary")!.color)
            : MTheme.t().colors.primary;

        var secondary = (customColorBox.get("secondary") != null)
            ? Color(customColorBox.get("secondary")!.color)
            : MTheme.t().colors.secondary;

        var brightness = (brightnessBox.get("isDarkMode") == true)
            ? Brightness.dark
            : Brightness.light;

        return MaterialApp(
          title: 'Flutter MultiTheme',
          initialRoute: "/",
          routes: {
            "/": (_) => const HomePage(),
            "/change_theme": (_) => const ChangeThemePage(),
          },
          theme: ThemeData(brightness: brightness).copyWith(
            colorScheme: themeData.colorScheme.copyWith(
              primary: primary,
              secondary: secondary,
            ),
          ),
        );
      },
    );
  }
}
