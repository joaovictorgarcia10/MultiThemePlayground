import 'package:flutter/material.dart';

class LocalTheme extends ChangeNotifier {
  Color? primary;
  Color? secondary;
  Color? warning;
  Color? danger;

  // Singleton (uma única instância para todo o app)
  LocalTheme._({
    this.primary,
    this.secondary,
    this.warning,
    this.danger,
  });

  static final LocalTheme _instance = LocalTheme._(
    primary: null,
    secondary: null,
    warning: null,
    danger: null,
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
}
