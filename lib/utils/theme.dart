import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const defaultTheme = ThemeMode.system;

Future<void> saveThemeMode(ThemeMode themeMode) async {
  final pref = await SharedPreferences.getInstance();
  pref.setString(themeMode.key, themeMode.name);
}

ThemeMode loadThemeMode(SharedPreferences pref) {
  return convertStrToThemeMode(
      pref.getString(defaultTheme.key) ?? defaultTheme.name);
}

ThemeMode convertStrToThemeMode(String str) {
  return ThemeMode.values.where((element) => element.name == str).first;
}

extension ThemeModeEx on ThemeMode {
  String get key => toString().split('.').first;
  String get name => toString().split('.').last;
}
