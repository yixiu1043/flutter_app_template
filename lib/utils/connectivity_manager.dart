import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectivityManager {
  ConnectivityManager._privateConstructor();

  static final ConnectivityManager _instance =
      ConnectivityManager._privateConstructor();

  static ConnectivityManager get instance {
    return _instance;
  }

  bool isConnect = false;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  void init() {
    checkConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void onResume() {
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
    _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
        isConnect = true;
        break;
      default:
        debugPrint('Failed to get connectivity.');
        isConnect = false;
        break;
    }
  }

  void dispose() {
    _connectivitySubscription.cancel();
  }
}
