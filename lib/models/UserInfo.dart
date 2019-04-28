import 'package:flutter/material.dart';

class UserInfo with ChangeNotifier {
  String _name;

  String get name => _name;

  UserInfo(this._name);

  void setName(name) {
    _name = name;
    notifyListeners();
  }
}
