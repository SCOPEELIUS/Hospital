import 'package:flutter/material.dart';
import 'package:hospital/httpFuncts/patientHttp.dart';
import 'package:hospital/models/patientModel.dart';
import 'package:hospital/models/responseModel.dart';

class PatientProvider extends ChangeNotifier {
  final patientHttp = PatientHttp();
  Patient patient = Patient();

  Future<bool> updatePatient() async {
    ApiResponse? resp = await patientHttp.updatePatient(patient);
    print(resp?.body ?? "");
    if (resp != null && resp.success) {
      patient = Patient.fromJson(resp.body);
      notifyListeners();
      return true;
    }
    return false;
  }

  void setPatient(Patient newPatient) {
    patient = newPatient;
    notifyListeners();
  }
}
