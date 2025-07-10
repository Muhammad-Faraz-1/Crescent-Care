// import 'package:crescent_care/utils/theme.dart';
import 'package:flutter/material.dart';


class Statemaneger extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setLightTheme() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }

  void setDarkTheme() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void setCustomTheme() {
    // you can create a custom enum if needed or manage externally
    _themeMode = ThemeMode.system; // or use custom logic
    notifyListeners();
  }
}
