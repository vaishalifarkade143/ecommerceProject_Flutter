import 'package:ecommerseproject/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerseproject/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/helpers/network_manager.dart';
import 'package:ecommerseproject/utils/popups/full_screen_loader.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  ///variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///send Reset Password Email
  Future<void> sendPasswordResetEmail() async {
    try {
      //Start Loading 
      TFullScreenLoader.openLoadingDialog('Proceessing your request...', TImages.cartAnimation);
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Validate Form
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //send Reset Password Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //Remove Loading
      TFullScreenLoader.stopLoading();

      //show Success Message
      TLoaders.successSnackBar(title: 'Success', message: 'Password reset email Link sent successfully. Please check your inbox.');

      // Redirect
      Get.to(()=> ResetPassword(email:  email.text.trim(),));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
    
  }

  Future<void> resendPasswordResetEmail(String email) async {
     try {
      //Start Loading 
      TFullScreenLoader.openLoadingDialog('Proceessing your request...', TImages.cartAnimation);
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //send Reset Password Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Remove Loading
      TFullScreenLoader.stopLoading();

      //show Success Message
      TLoaders.successSnackBar(title: 'Success', message: 'email Link sent successfully to  reset your Password . Please check your inbox.');

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}
