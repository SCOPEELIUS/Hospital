import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

enum ConnectivityStatus { online, offline }

class ConnectivityProvider extends ChangeNotifier {
  late Connectivity _connectivity;
  late ConnectivityStatus _status;
  late BuildContext _context;

  ConnectivityStatus get status => _status;

  ConnectivityProvider() {
    _connectivity = Connectivity();
    _status = ConnectivityStatus.offline;
    _connectivity.checkConnectivity().then((value) {
      _status = value.contains(ConnectivityResult.none)
          ? ConnectivityStatus.offline
          : _status = ConnectivityStatus.online;
      notifyListeners(); // Notify listeners to update the UI based on the connectivity status
    });
  }
  void start(BuildContext context) {
    _context = context;
    _connectivity.onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.none)) {
        _status = ConnectivityStatus.offline;
        notifyListeners();
        showNetStatus();
      } else {
        _status = ConnectivityStatus.online;
        notifyListeners();
      }
    });
  }

  void showNetStatus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final scaffold = ScaffoldMessenger.of(_context);
      scaffold.hideCurrentSnackBar();
      scaffold.showSnackBar(
        SnackBar(
          backgroundColor:
              _status == ConnectivityStatus.offline ? Colors.red : Colors.green,
          content: _status == ConnectivityStatus.offline
              ? const Text(
                  "You are Offline",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              : const Text(
                  "Online",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
          duration: const Duration(seconds: 3),
        ),
      );
    });
  }
}
