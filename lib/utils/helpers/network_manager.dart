// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';

// class NetworkManager extends GetxController {
//   /// A utility class for managing network connectivity status in a Flutter application.
//   /// This class provides methods to check the current network status and listen for changes in connectivity.
//   /// It uses the `connectivity_plus` package to monitor network status and provides a simple interface for other parts of the app to interact with.
//   static NetworkManager get instance => Get.find();

//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
//   final Rx<ConnectivityResult> _connectivityStatus =
//       ConnectivityResult.none.obs;

//   /// Checks if the device is currently connected to the internet.
//   @override
//   void onInit() {
//     super.onInit();
//     _connectivitySubscription =
//         _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     _connectivityStatus.value = result;
//     if (_connectivityStatus.value == ConnectivityResult.none) {
//       TLoaders.warningSnackbar(title: "No Internet Connection");
//     }
//   }

//   /// Check the internet connection status.
//   /// Returns `true` if the device is connected to the internet, otherwise returns `false`.
//   Future<bool> isConnected() async {
//     try {
//       final result = await _connectivity.checkConnectivity();
//       if( result == ConnectivityResult.none){
//         return false;
//       } else {
//         return true;
//       }
//     } catch (e) {
//       return false;
//     }
//   }
// }


import 'dart:async';
import 'dart:io';
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
      TLoaders.warningSnackbar(title: "No Internet Connection");
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