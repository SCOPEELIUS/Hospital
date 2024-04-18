import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital/httpFuncts/userHttp.dart';
import 'package:hospital/models/responseModel.dart';

import '../models/userModel.dart';

class UsersProvider extends ChangeNotifier {
  Users users = Users();
  final userHttp = UserHttp();
  bool available = false;

  Future getAllUsers() async {
    ApiResponse? resp = await userHttp.GetAll();
    print(resp?.body ?? "");
    if (resp != null && resp.success) {
      users = Users.fromJsonList(resp.body);
      available = true;
      notifyListeners();
    }
  }
}
