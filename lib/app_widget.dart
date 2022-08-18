// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:multi_theme_playground/global_theme/global_theme.dart';
import 'package:multi_theme_playground/local_theme/local_theme.dart';
import 'package:multi_theme_playground/pages/change_theme/change_theme_page.dart';
import 'package:multi_theme_playground/pages/home_page.dart';

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

    ThemeData themeData = ThemeData();

    // Sets the GlobalTheme from Design System using de .env build settings
    GTheme.t(theme: globalTheme);
    LocalTheme localTheme = LocalTheme.instance;

    return AnimatedBuilder(
      animation: localTheme,
      builder: (_, __) {
        // Theme Settings Variables
        var primary = (localTheme.customColorBox.get("primary") != null)
            ? Color(localTheme.customColorBox.get("primary")!.color)
            : GTheme.t().colors.primary;

        var secondary = (localTheme.customColorBox.get("secondary") != null)
            ? Color(localTheme.customColorBox.get("secondary")!.color)
            : GTheme.t().colors.secondary;

        var brightness = (localTheme.brightnessBox.get("isDarkMode") == true)
            ? Brightness.dark
            : Brightness.light;

        return MaterialApp(
          title: 'MultiTheme App',
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
