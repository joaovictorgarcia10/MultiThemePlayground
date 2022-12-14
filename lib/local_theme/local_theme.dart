import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multi_theme_playground/local_theme/models/custom_color.dart';

class LocalTheme extends ChangeNotifier {
  // Singleton
  LocalTheme._();
  static final LocalTheme _instance = LocalTheme._();
  static get instance => _instance;

  // HIVE
  final customColorBox = Hive.box<CustomColor?>("customColorBox");
  final brightnessBox = Hive.box<bool>("brightnessBox");

  // ACTIONS
  Future<void> disposeLocalTheme() async {
    await customColorBox.clear();
    await brightnessBox.clear();
    notifyListeners();
  }

  Future<void> setPrimaryColor({CustomColor? color}) async {
    await customColorBox.put("primary", color);
    notifyListeners();
  }

  Future<void> setSecondaryColor({CustomColor? color}) async {
    await customColorBox.put("secondary", color);
    notifyListeners();
  }

  Future<void> setDarkMode(bool value) async {
    await brightnessBox.put("isDarkMode", value);
    notifyListeners();
  }
}
