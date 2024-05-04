import 'package:flutter/material.dart';
import 'package:hospital/httpFuncts/userHttp.dart';
import 'package:hospital/models/responseModel.dart';
import 'package:hospital/models/userModel.dart';

class DoctorsProvider extends ChangeNotifier {
  Users doctors = Users();
  final userHttp = UserHttp();
  bool available = false;

  Future getAllDoctors() async {
    ApiResponse? resp = await userHttp.getAllDoctors();
    if (resp != null && resp.success) {
      doctors = Users.fromJsonList(resp.body);
      available = true;
      notifyListeners();
    }
  }

  User? getUserName(String email) {
    return doctors.users
        ?.firstWhere((doctor) => doctor.email == email, orElse: () => User());
  }

  String? getDoctorNameById(String id) {
    var a = doctors.users
        ?.firstWhere((doctor) => doctor.id == id, orElse: () => User());
    return "${a?.firstName} ${a?.lastName}";
  }
}
