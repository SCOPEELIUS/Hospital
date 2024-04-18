import 'package:flutter/material.dart';
import 'package:hospital/httpFuncts/patientHttp.dart';
import 'package:hospital/httpFuncts/userHttp.dart';
import 'package:hospital/models/patientModel.dart';
import 'package:hospital/models/responseModel.dart';

class PatientsProvider extends ChangeNotifier {
  final patientHttp = PatientHttp();
  bool available = false;
  Patients patients = Patients();

  Future getAllPatients() async {
    ApiResponse? resp = await patientHttp.getAllPatients();
    print(resp?.body ?? "");
    if (resp != null && resp.success) {
      patients = Patients.fromJsonList(resp.body);
      available = true;
      notifyListeners();
    }
  }

  Patient? getIndexedPatient(int index) {
    return patients.patients?[index];
  }
}
