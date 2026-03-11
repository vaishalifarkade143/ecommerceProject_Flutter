// import 'package:ecommerseproject/data/repositories/authentication_repository.dart';
// import 'package:ecommerseproject/features/personalization/controller/user_controller.dart';
// import 'package:ecommerseproject/utils/constants/image_strings.dart';
// import 'package:ecommerseproject/utils/helpers/network_manager.dart';
// import 'package:ecommerseproject/utils/popups/full_screen_loader.dart';
// import 'package:ecommerseproject/utils/popups/loader.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class LoginController extends GetxController {
//   // variables and methods for login logic will go here
//   final hidePassword = true.obs;
//   final rememberMe = false.obs;
//   final localStorage = GetStorage();
//   final email = TextEditingController();
//   final password = TextEditingController();
//   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

//   @override
//   void onInit() {
//     super.onInit();
//     // Load saved email and password if "Remember Me" was previously enabled
//     // FIX: only load saved credentials if they actually exist
//     final savedEmail = localStorage.read('REMEMBER_ME_EMAIL');
//     final savedPassword = localStorage.read('REMEMBER_ME_PASSWORD');
//     if (savedEmail != null && savedPassword != null) {
//       email.text = savedEmail;
//       password.text = savedPassword;
//       rememberMe.value = true;
//     }
//   }

//   Future<void> emailAndPasswordSignIn() async {
//     // Implement login logic here, such as form validation and authentication
//     try {
//       //start loading
//       TFullScreenLoader.openLoadingDialog(
//           "Logging you in ... ", TImages.cartAnimation);

//       //check Internet Connection
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }

//       //Form Validation
//       if (!loginFormKey.currentState!.validate()) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }
//       //save user preference for "Remember Me"
//       if (rememberMe.value) {
//         localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
//         localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
//       } else {
//         // FIX: clear saved credentials if Remember Me is unchecked
//         localStorage.remove('REMEMBER_ME_EMAIL');
//         localStorage.remove('REMEMBER_ME_PASSWORD');
//       }
//       //lOGIN
//       await AuthenticationRepository.instance
//           .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

//       //Remove loading
//       TFullScreenLoader.stopLoading();

// //Remove
//       AuthenticationRepository.instance.screenRedirect();
//     } catch (e) {
//       // Handle exceptions, such as showing error messages to the user
//       TFullScreenLoader.stopLoading();
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     }
//   }

//   ///-- Google Sign In Authentication Method
//   Future<void> googleSignIn() async {
//     // Implement Google Sign-In logic here
//     try {
//       //start loading
//       TFullScreenLoader.openLoadingDialog(
//           "Logging you in ... ", TImages.cartAnimation);

//       //check Internet Connection
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }

//       //Google Authentication
//       final userCredentials =
//           await AuthenticationRepository.instance.signInWithGoogle(); 

//       //Save user data to Firestore
//       await UserController.instance.saveUserRecord(userCredentials);

//       //Remove loading
//       TFullScreenLoader.stopLoading();
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     }
//   }
// }



import 'package:ecommerseproject/data/repositories/authentication_repository.dart';
import 'package:ecommerseproject/features/personalization/controller/user_controller.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/helpers/network_manager.dart';
import 'package:ecommerseproject/utils/popups/full_screen_loader.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    final savedEmail = localStorage.read('REMEMBER_ME_EMAIL');
    final savedPassword = localStorage.read('REMEMBER_ME_PASSWORD');
    if (savedEmail != null && savedPassword != null) {
      email.text = savedEmail;
      password.text = savedPassword;
      rememberMe.value = true;
    }
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.cartAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      } else {
        localStorage.remove('REMEMBER_ME_EMAIL');
        localStorage.remove('REMEMBER_ME_PASSWORD');
      }

      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // ✅ Stop loader BEFORE navigating to avoid black screen
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.cartAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // ✅ Get credentials from Google
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // ✅ Save user record to Firestore
      await UserController.instance.saveUserRecord(userCredentials);

      // ✅ Stop loader BEFORE navigating — fixes black screen
      TFullScreenLoader.stopLoading();

      // ✅ Navigate once here only
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
