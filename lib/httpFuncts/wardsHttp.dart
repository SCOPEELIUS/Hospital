import 'dart:convert';

import 'package:hospital/models/responseModel.dart';
import 'package:hospital/models/userModel.dart';
import 'package:hospital/models/ward.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://45.79.53.206:3700/ward/";
Map<String, String> headers = {
  'Content-Type': 'application/json',
};

class WardHttp {
  var client = http.Client();

  Future<bool> createWard(Ward ward) async {
    var body = jsonEncode(ward.toJson());

    var url = Uri.parse("${baseUrl}register");
    try {
      var response = await client.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        var resp = ApiResponse.fromJson(jsonDecode(response.body));
        return resp.success;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<ApiResponse?> getAllWards() async {
    var url = Uri.parse("${baseUrl}all");
    try {
      var response = await client.get(url, headers: headers);
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
