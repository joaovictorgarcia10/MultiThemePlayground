import 'package:multi_theme_playground/global_theme/global_colors.dart';

// These Global Theme Config can be brought from a Design System Package
abstract class GlobalTheme {
  GlobalColors get colors;
  String get theme;
  String get themeIndex;
}

class StandardTheme implements GlobalTheme {
  @override
  GlobalColors get colors => StandardColors();

  @override
  String get theme => 'Creche';

  @override
  String get themeIndex => '0';
}

class OtherTheme implements GlobalTheme {
  @override
  GlobalColors get colors => OtherColors();

  @override
  String get theme => 'Other';

  @override
  String get themeIndex => '1';
}

class GTheme {
  static GlobalTheme? _instance;

  static GlobalTheme t({String? theme}) {
    if (_instance == null && theme == null) {
      _instance = StandardTheme();
    } else if (theme != null) {
      if (_instance == null || _instance!.theme != theme) {
        switch (theme) {
          case "Standard":
            _instance = StandardTheme();
            break;
          case "Other":
            _instance = OtherTheme();
            break;
          default:
            throw "$theme is not a valid theme";
        }
      }
    }

    return _instance!;
  }
}
