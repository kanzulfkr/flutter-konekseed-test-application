import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  int? _userId;
  int? get getUserId => _userId;

  String? _userName;
  String? get getUserName => _userName;

  void setUserId(int? value) async {
    _userId = value;
    notifyListeners();
  }

  void setUserName(String? value) async {
    _userName = value;
    notifyListeners();
  }
}
