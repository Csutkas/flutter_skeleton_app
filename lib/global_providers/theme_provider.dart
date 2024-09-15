import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? _theme = ThemeData.light();

  ThemeData? get theme => _theme;

  void changeTheme(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }
}
