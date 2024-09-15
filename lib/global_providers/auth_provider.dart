import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _user = "Guest";

  String get user => _user;

  void login(String username) {
    _user = username;
    notifyListeners();
  }

  void logout() {
    _user = "Guest";
    notifyListeners();
  }
}
