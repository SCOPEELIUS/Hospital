import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hospital/httpFuncts/patientHttp.dart';
import 'package:hospital/httpFuncts/wardsHttp.dart';
import 'package:hospital/models/patientModel.dart';
import 'package:hospital/models/responseModel.dart';
import 'package:hospital/models/ward.dart';

class PatientsProvider extends ChangeNotifier {
  final patientHttp = PatientHttp();
  final wardHttp = WardHttp();
  bool available = false;
  Patients patients = Patients();
  Wards wards = Wards(wards: []);

  Future getAllPatients() async {
    ApiResponse? resp = await patientHttp.getAllPatients();
    print(resp?.body ?? "");
    if (resp != null && resp.success) {
      patients = Patients.fromJsonList(resp.body);
      available = true;
      notifyListeners();
    }
  }

  bool updatePatient(Patient newpatient) {
    int index = patients.patients!
        .indexWhere((patient) => patient.carId == newpatient.id);
    if (index != -1) {
      patients.patients![index] = newpatient;
      notifyListeners();
      return true;
    }
    return false;
  }

  Patient? getIndexedPatient(int index) {
    return patients.patients?[index];
  }

  Patient? getPatientWithId(String id) {
    return patients.patients
        ?.firstWhere((patient) => patient.carId == id, orElse: () => Patient());
  }

  Future<bool> removePatientWithId(String id) async {
    int index = patients.patients!.indexWhere((patient) => patient.carId == id);

    if (index != -1) {
      bool deleted = await patientHttp.deletePatient(id);
      if (deleted) {
        patients.patients!.removeAt(index);
        notifyListeners();
      }

      return true;
    }
    return false;
  }

  Future<void> removePatientWithNumber(int index) async {
    bool deleted =
        await patientHttp.deletePatient(patients.patients![index].carId ?? "");
    if (deleted) {
      patients.patients!.removeAt(index);
      notifyListeners();
    }
  }

  Future getAllWards() async {
    ApiResponse? resp = await wardHttp.getAllWards();
    print(resp?.body ?? "");
    if (resp != null && resp.success) {
      wards = Wards.fromJsonList(resp.body);
      available = true;
      notifyListeners();
    }
  }

  Future<bool> createWard(Ward ward) async {
    bool resp = await wardHttp.createWard(ward);
    if (resp) {
      wards.wards.add(ward);
      notifyListeners();
      return true;
    }
    return false;
  }
}
