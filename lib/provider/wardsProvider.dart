import 'package:flutter/material.dart';
import 'package:hospital/httpFuncts/userHttp.dart';
import 'package:hospital/httpFuncts/wardsHttp.dart';
import 'package:hospital/models/responseModel.dart';
import 'package:hospital/models/ward.dart';

class WardProvider extends ChangeNotifier {
  final wardHttp = WardHttp();
  Ward ward = Ward();
  Wards wards = Wards(wards: []);

  Future getAllWards() async {
    ApiResponse? resp = await wardHttp.getAllWards();
    print(resp?.body ?? "");
    if (resp != null && resp.success) {
      wards = Wards.fromJsonList(resp.body);
      notifyListeners();
    }
  }

  Future<bool> createWard(Ward wardnew) async {
    ward = wardnew;
    bool resp = await wardHttp.createWard(wardnew);

    if (resp) {
      wards.wards.add(wardnew);
      notifyListeners();
      return resp;
    }
    return resp;
  }
}
