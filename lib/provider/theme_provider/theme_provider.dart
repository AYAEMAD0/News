import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier {
  late ThemeMode themeApp = ThemeMode.dark;
  Future<void> changeTheme(newTheme) async {
    if (newTheme == themeApp) {
      return;
    } else {
      themeApp = newTheme;
    }
    notifyListeners();
  }

  bool isDark() {
    return themeApp == ThemeMode.dark;
  }
}
