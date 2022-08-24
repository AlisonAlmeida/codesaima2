import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isAppThemeDark = false;

  bool get getThemeMode {
    return isAppThemeDark;
  }

  changeTheme(bool value) {
    isAppThemeDark = !isAppThemeDark;
    notifyListeners();
  }
}
