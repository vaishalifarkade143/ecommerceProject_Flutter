import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TDeviceUtils {

// Method to check if the device is in landscape mode
// This method checks the orientation of the device and returns true if it is in landscape mode.
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // This method is a placeholder for setting the status bar color.
  // Actual implementation may vary based on the platform and requirements.
  // For example, you might use SystemChrome.setSystemUIOverlayStyle in Flutter.
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color, // Set the status bar color
        statusBarIconBrightness: Brightness.light, // Set the icon brightness
        statusBarBrightness: Brightness.dark, // Set the status bar brightness
      ),
    );
  }

// Method to check if the device is in landscape orientation
// This method checks the view insets to determine if the device is in landscape orientation.
// It returns true if the bottom view inset is zero, indicating landscape orientation.
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

// Method to check if the device is in portrait orientation
// This method checks the view insets to determine if the device is in portrait orientation.
// It returns true if the bottom view inset is not zero, indicating portrait orientation.
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsents = View.of(context).viewInsets;
    return viewInsents.bottom != 0;
  }

// Method to set the device in full-screen mode
// This method sets the system UI mode to immersive sticky, which hides the system bars and allows for a full-screen experience.
// It takes a boolean parameter 'enable' to determine whether to enable or disable full-screen mode.
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

// Method to get the bottom navigation bar height
// This method retrieves the height of the bottom navigation bar using the constant kBottomNavigationBarHeight

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }


    static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double getKeyboardHeight(){
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisile() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  // static Future<bool> isPhysicalDevice() async {
  //   return defaultTergetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;
  // }

// Method to get the screen height
// This method retrieves the height of the screen using MediaQuery.
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

// Method to get the screen width
// This method retrieves the width of the screen using MediaQuery.
  static double getScreenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  /// Get pixel ratio
  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

// Method to get the status bar height
// This method retrieves the height of the status bar using MediaQuery.
// It is useful for adjusting layouts based on the status bar height.
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }



// Method to trigger a vibration on the device
  // This method uses HapticFeedback to trigger a vibration for a specified duration.
  static void vibrate(Duration duration) {
    // This method triggers a vibration on the device for the specified duration.
    // The actual implementation may vary based on the platform and requirements.
    HapticFeedback.vibrate();
    Future.delayed(duration, () {
      HapticFeedback.vibrate();
    });
  }

// Method to set preferred orientations
  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    // This method sets the preferred orientations for the application.
    // It uses SystemChrome.setPreferredOrientations to set the specified orientations.
    await SystemChrome.setPreferredOrientations(orientations);
  }

// Method to hide the status bar
  // This method hides the status bar by setting the system UI mode to manual and specifying no overlays.
  // It is useful for creating a full-screen experience without the status bar.
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    // This method shows the status bar by setting the system UI mode to edge to edge.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}












// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';

// class TDeviceUtility {
//   /// Hide keyboard
//   static void hideKeyboard(BuildContext context) {
//     FocusScope.of(context).unfocus();
//   }

//   /// Set status bar color and brightness
//   static Future<void> setStatusBarColor(
//     Color color, {
//     Brightness iconBrightness = Brightness.light,
//   }) async {
//     SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(
//         statusBarColor: color,
//         statusBarIconBrightness: iconBrightness,
//         statusBarBrightness: iconBrightness,
//       ),
//     );
//   }

//   /// Check if device is in landscape
//   static bool isLandscapeOrientation(BuildContext context) {
//     return MediaQuery.of(context).orientation == Orientation.landscape;
//   }

//   /// Check if device is in portrait
//   static bool isPortraitOrientation(BuildContext context) {
//     return MediaQuery.of(context).orientation == Orientation.portrait;
//   }

//   /// Enable/disable fullscreen mode
//   static void setFullScreen(bool enable) {
//     SystemChrome.setEnabledSystemUIMode(
//       enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
//     );
//   }

//   /// Screen height
//   static double getScreenHeight(BuildContext context) {
//     return MediaQuery.of(context).size.height;
//   }

//   /// Screen width
//   static double getScreenWidth(BuildContext context) {
//     return MediaQuery.of(context).size.width;
//   }

//   /// Pixel ratio
//   static double getPixelRatio(BuildContext context) {
//     return MediaQuery.of(context).devicePixelRatio;
//   }

//   static double getBottomNavigationBarHeight() {
//     return kBottomNavigationBarHeight;
//   }
// }
