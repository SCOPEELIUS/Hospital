import 'dart:convert';

import 'package:hospital/models/responseModel.dart';
import 'package:hospital/models/userModel.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://45.79.53.206:3700/users/";
Map<String, String> headers = {
  'Content-Type': 'application/json',
};

class UserHttp {
  var Client = http.Client();

  Future<bool> createUser(User user) async {
    var body = jsonEncode(user.toJson());

    var url = Uri.parse("${baseUrl}register");
    var response = await Client.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var resp = ApiResponse.fromJson(jsonDecode(response.body));
      return resp.success;
    } else {
      return false;
    }
  }

  Future<ApiResponse?> logIn(User user) async {
    var body = jsonEncode(user.toJson());

    var url = Uri.parse("${baseUrl}login");
    var response = await Client.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var resp = ApiResponse.fromJson(jsonDecode(response.body));
      return resp;
    } else {
      return null;
    }
  }

  Future<ApiResponse?> getAll() async {
    var url = Uri.parse("${baseUrl}all");
    var response = await Client.get(url, headers: headers);
    if (response.statusCode == 200) {
      var resp = ApiResponse.fromJson(jsonDecode(response.body));
      return resp;
    } else {
      return null;
    }
  }

  Future<ApiResponse?> getAllNurses() async {
    var url = Uri.parse("${baseUrl}specific/Nurse");
    try {
      var response = await Client.get(url, headers: headers);
      if (response.statusCode == 200) {
        var resp = ApiResponse.fromJson(jsonDecode(response.body));
        return resp;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<ApiResponse?> getAllDoctors() async {
    var url = Uri.parse("${baseUrl}specific/Doctor");
    try {
      var response = await Client.get(url, headers: headers);
      if (response.statusCode == 200) {
        var resp = ApiResponse.fromJson(jsonDecode(response.body));
        return resp;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
