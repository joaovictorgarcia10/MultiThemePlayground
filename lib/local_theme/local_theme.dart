import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multi_theme_playground/local_theme/models/custom_color.dart';

class LocalTheme extends ChangeNotifier {
  CustomColor? primary;
  CustomColor? secondary;
  CustomColor? warning;
  CustomColor? danger;
  bool isDarkMode;

  // Singleton (uma única instância para todo o app)
  LocalTheme._({
    this.primary,
    this.secondary,
    this.warning,
    this.danger,
    this.isDarkMode = false,
  });

  static final LocalTheme _instance = LocalTheme._(
    primary: null,
    secondary: null,
    warning: null,
    danger: null,
    isDarkMode: false,
  );

  static get instance => _instance;

  // HIVE
  static final customColorBox = Hive.box<CustomColor?>("customColorBox");
  static final brightnessBox = Hive.box<bool>("brightnessBox");

  Future<void> setPrimaryColor({CustomColor? color}) async {
    await customColorBox.put("primary", color);
    notifyListeners();
  }

  Future<void> setSecondaryColor({CustomColor? color}) async {
    await customColorBox.put("secondary", color);
    notifyListeners();
  }

  Future<void> setWarningColor({CustomColor? color}) async {
    await customColorBox.put("warning", color);
    notifyListeners();
  }

  Future<void> setDangerColor({CustomColor? color}) async {
    await customColorBox.put("danger", color);
    notifyListeners();
  }

  Future<void> setDarkMode(bool value) async {
    await brightnessBox.put("isDarkMode", value);
    notifyListeners();
  }
}
