import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pokemon_flutter/utils/theme.dart';

class ThemeModeNotifier extends ChangeNotifier {
  late ThemeMode _themeMode;

  ThemeModeNotifier(SharedPreferences pref) {
    _init(pref);
  }

  ThemeMode get themeMode => _themeMode;

  void _init(SharedPreferences pref) async {
    _themeMode = loadThemeMode(pref);
    notifyListeners();
  }

  void update(ThemeMode nextThemeMode) {
    _themeMode = nextThemeMode;
    saveThemeMode(nextThemeMode);
    notifyListeners();
  }
}
