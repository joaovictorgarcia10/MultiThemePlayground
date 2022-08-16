import 'package:flutter/material.dart';

class LocalTheme extends ChangeNotifier {
  Color? primary;
  Color? secondary;
  Color? warning;
  Color? danger;
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

  // TODO: Salvar definiçōes de cores locais em um local storage e recuperar a partir dele
  void setPrimaryColor({Color? color}) {
    primary = color;
    notifyListeners();
  }

  void setSecondaryColor({Color? color}) {
    secondary = color;
    notifyListeners();
  }

  void setWarningColor({Color? color}) {
    warning = color;
    notifyListeners();
  }

  void setDangerColor({Color? color}) {
    danger = color;
    notifyListeners();
  }

  void setDarkMode(bool value) {
    isDarkMode = value;
    notifyListeners();
  }
}
