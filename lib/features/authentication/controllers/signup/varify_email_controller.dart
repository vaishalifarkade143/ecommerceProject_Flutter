

import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // variables and methods for handling email verification logic will go here
   
   @override
  void onInit() {
    super.onInit();
    // sendVerificationEmail();
  }
  /// send email verification link
  /// Timer to acutomatically check email verification status every 5 seconds
  /// manually check email verification status
} 