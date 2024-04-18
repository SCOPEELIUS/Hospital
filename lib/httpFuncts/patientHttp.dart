import 'dart:convert';

import 'package:hospital/models/patientModel.dart';
import 'package:hospital/models/responseModel.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://45.79.53.206:3700/patient/";
Map<String, String> headers = {
  'Content-Type': 'application/json',
};

class PatientHttp {
  var client = http.Client();

  Future<bool> createPatient(Patient patient) async {
    var body = jsonEncode(patient.toJson());
    print(body);
    var url = Uri.parse("${baseUrl}register");
    var response = await client.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      print(response.body);
      var resp = ApiResponse.fromJson(jsonDecode(response.body));
      return resp.success;
    } else {
      return false;
    }
  }

  Future<ApiResponse?> getAllPatients() async {
    var url = Uri.parse("${baseUrl}all");
    var response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
      var resp = ApiResponse.fromJson(jsonDecode(response.body));
      return resp;
    } else {
      return null;
    }
  }

  Future<ApiResponse?> updatePatient(Patient patient) async {
    var body = jsonEncode(patient.toJson());
    print(body);
    var url = Uri.parse("$baseUrl${patient.id}");
    var response = await client.patch(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      print(response.body);
      var resp = ApiResponse.fromJson(jsonDecode(response.body));
      return resp;
    } else {
      return null;
    }
  }
  //delete Patient
}
