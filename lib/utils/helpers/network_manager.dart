


import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {

  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final Rx<ConnectivityResult> _connectivityStatus =
      ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((results) {
      _updateConnectionStatus(results.first);
    });
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectivityStatus.value = result;

    if (_connectivityStatus.value == ConnectivityResult.none) {
      TLoaders.CustomToast(message: "No Internet Connection");
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();

      if (result.contains(ConnectivityResult.none)) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
     _connectivitySubscription.cancel();
  }
}