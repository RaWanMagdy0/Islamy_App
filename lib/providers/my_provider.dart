import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode theme = ThemeMode.light;
  String locale = "en";

  changeTheme(ThemeMode mode) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    theme = mode;
    theme == ThemeMode.light
        ? pref.setBool("isLight", true)
        : pref.setBool("isLight", false);
    notifyListeners();
  }

  loadThemeLang() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isLight = pref.getBool("isLight");
    if (isLight != null) {
      theme = isLight ? ThemeMode.light : ThemeMode.dark;
    }
  }

  changeLanguage(String langCode) {
    locale = langCode;
    notifyListeners();
  }
}
