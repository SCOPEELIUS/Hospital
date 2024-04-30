import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital/httpFuncts/userHttp.dart';
import 'package:hospital/models/responseModel.dart';

import '../models/userModel.dart';

class NursesProvider extends ChangeNotifier {
  Users nurses = Users();
  final userHttp = UserHttp();
  bool available = false;

  Future getAllNurses() async {
    ApiResponse? resp = await userHttp.getAllNurses();
    print(resp?.body ?? "");
    if (resp != null && resp.success) {
      nurses = Users.fromJsonList(resp.body);
      available = true;
      notifyListeners();
    }
  }

  User? getUserName(String email) {
    return nurses.users
        ?.firstWhere((nurse) => nurse.email == email, orElse: () => User());
  }
}
