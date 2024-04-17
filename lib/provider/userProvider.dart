import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital/httpFuncts/userHttp.dart';
import 'package:hospital/models/responseModel.dart';
import 'package:hospital/models/userModel.dart';

class UserProvider extends ChangeNotifier {
  bool logIn = false;
  final userHttp = UserHttp();
  User user = User();

  Future<void> signIn() async {
    ApiResponse? resp = await userHttp.LogIn(user);
    if (resp != null && resp.success) {
      user = User.fromJson(jsonDecode(resp.body));
      logIn = true;
      notifyListeners();
    }
  }

  Future<bool> signUp() async {
    var resp = await userHttp.CreateUser(user);
    if (resp) {
      logIn = true;
    } else {
      logIn = true;
    }
    notifyListeners();
    return logIn;
  }
}
