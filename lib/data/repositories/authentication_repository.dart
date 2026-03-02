import 'package:ecommerseproject/features/authentication/screens/login/login.dart';
import 'package:ecommerseproject/features/authentication/screens/onbording/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// call from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relavent screen according to the auth state of user
  screenRedirect() async {
    ///Local Storage Data
     if(kDebugMode){
      print('============= Get Storage Data =============');
      print('Is First Time : ${deviceStorage.read('IsFirstTime')}');
      print(deviceStorage.read('IsFirstTime'));
     }
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
    // Get.offAll(() => const OnBoardingScreen());
  }
}
