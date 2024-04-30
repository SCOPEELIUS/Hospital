import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital/httpFuncts/userHttp.dart';
import 'package:hospital/models/responseModel.dart';
import 'package:hospital/models/userModel.dart';

class UserProvider extends ChangeNotifier {
  bool logIn = false;
  final userHttp = UserHttp();
  User user = User();

  Future<bool> signIn(String email, String password) async {
    user.email = email;
    user.password = password;
    ApiResponse? resp = await userHttp.logIn(user);
    if (resp != null && resp.success) {
      user = User.fromJson(resp.body);
      logIn = true;
      notifyListeners();
      return logIn;
    }
    return logIn;
  }

  Future<bool> signUp(User newUser) async {
    user = newUser;
    var resp = await userHttp.createUser(user);
    if (resp) {
      logIn = true;
    } else {
      logIn = false;
    }
    notifyListeners();
    return logIn;
  }

  void setUser(User newUser) {
    user = newUser;
    notifyListeners();
  }
}
