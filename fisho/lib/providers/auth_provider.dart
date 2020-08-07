import 'dart:collection';
import 'package:fisho/models/user_model.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier { 
  static User _user = null;
  User get user => _user;

  bool authenticated = false;
  
  void login() {
    // _user = data;
    authenticated = true;
    notifyListeners();
  }

  void logout() {
    _user = null;
    authenticated = false;
    notifyListeners();
  }
}
