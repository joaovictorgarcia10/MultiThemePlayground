import 'package:flutter/material.dart';
import 'package:flutter_atomic_design/exports/tokens.dart';
import 'package:multi_theme_playground/pages/change_theme_page.dart';
import 'package:multi_theme_playground/local_theme/local_theme.dart';
import 'package:multi_theme_playground/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  final String globalTheme;

  const AppWidget({Key? key, required this.globalTheme}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData();

    // Temas
    MTheme.t(theme: globalTheme);
    LocalTheme localTheme = LocalTheme.instance;

    return AnimatedBuilder(
      animation: localTheme,
      builder: (_, __) {
        return MaterialApp(
          title: 'Flutter MultiTheme',
          initialRoute: "/",
          routes: {
            "/": (_) => const HomePage(),
            "/change_theme": (_) => const ChangeThemePage(),
          },
          theme: themeData.copyWith(
            colorScheme: themeData.colorScheme.copyWith(
              primary: localTheme.primary ?? MTheme.t().colors.primary,
              secondary: localTheme.secondary ?? MTheme.t().colors.secondary,
            ),
          ),
        );
      },
    );
  }
}
