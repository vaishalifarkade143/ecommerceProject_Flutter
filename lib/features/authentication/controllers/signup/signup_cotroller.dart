// import 'package:ecommerseproject/data/repositories/authentication_repository.dart';
// import 'package:ecommerseproject/data/user/user_repository.dart';
// import 'package:ecommerseproject/features/authentication/screens/signup/widgets/verify_email.dart';
// import 'package:ecommerseproject/features/personalization/model/user_model.dart';
// import 'package:ecommerseproject/utils/constants/image_strings.dart';
// import 'package:ecommerseproject/utils/helpers/network_manager.dart';
// import 'package:ecommerseproject/utils/popups/full_screen_loader.dart';
// import 'package:ecommerseproject/utils/popups/loader.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class SignUpController extends GetxController {
//   static SignUpController get instance => Get.find();
//   // variables and methods for handling sign up logic will go here
//   final hidePassword = true
//       .obs; // Observable variable to manage password visibility showing / hiding password
//   final privacyPolicy = true.obs;

//   final email = TextEditingController();
//   final password = TextEditingController();
//   final firstName = TextEditingController();
//   final lastName = TextEditingController();
//   final userName = TextEditingController();
//   final phoneNumber = TextEditingController();
//   GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

//   /// -- SINGUP
//   void signUp() async {
//     try {
//       // start loading
//       TFullScreenLoader.openLoadingDialog(
//           "We are processing your information ... ",
//           TImages.staticSuccessIllustration);
//       //check Internet Connection
//       final isConnected = await NetworkManager.instance.isConnected();
//       // validate form
//       if (!isConnected) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }

//       //Form Validation
//       if (!signUpFormKey.currentState!.validate()) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }

//       //Privacy Policy and Terms of Service  validation can be added here
//       if (!privacyPolicy.value) {
//         //  TFullScreenLoader.stopLoading();
//         TLoaders.warningSnackbar(
//             title: 'Accept Privacy Policy ',
//             message:
//                 'In order to create account , you must accept our Privacy Policy and Terms of Service');
//         return;
//       }

//       // Register user in the Firebase Authentication and Firestore Database
//       final userCredential = await AuthenticationRepository.instance
//           .registerWithEmailAndPassword(
//               email.text.trim(), password.text.trim());
//       // save Authentication user data in the Firebase FireStore
//       final newUser = UserModel(
//           id: userCredential.user!.uid,
//           firstName: firstName.text.trim(),
//           lastName: lastName.text.trim(),
//           email: email.text.trim(),
//           phoneNumber: phoneNumber.text.trim(),
//           userName: userName.text.trim(),
//           profilePicture: '');

//       // final userRepository = Get.put(UserRepository());
//       final userRepository = UserRepository.instance;
//       await userRepository.saveUserRecord(newUser);

// // ✅ Send verification email HERE — user is confirmed logged in at this point
// await AuthenticationRepository.instance.sendEmailVerification();

//       //Remove Loader
//       TFullScreenLoader.stopLoading();

//       //show  Success Message
//       TLoaders.successSnackBar(
//           title: 'Congratulations',
//           message: 'Your account has been created successfully!');

//       // Move to verify Email screen
//       Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));

//       // Show success message or navigate to another screen
//       // Get.snackbar("Success", "Your account has been created successfully!");
//     } catch (e) {
//        //Remove  Loader
//       TFullScreenLoader.stopLoading();
//       // show some Generic Error  to the user
//       TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
//     }
//     // finally {
//     //   //Remove  Loader
//     //   TFullScreenLoader.stopLoading();
//     // }
//   }
// }

import 'package:ecommerseproject/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerseproject/data/user/user_repository.dart';
import 'package:ecommerseproject/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:ecommerseproject/features/personalization/model/user_model.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/helpers/network_manager.dart';
import 'package:ecommerseproject/utils/popups/full_screen_loader.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  // variables and methods for handling sign up logic will go here
  final hidePassword = true
      .obs; // Observable variable to manage password visibility showing / hiding password
  final privacyPolicy = true.obs;

  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  /// -- SINGUP
  void signUp() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          "We are processing your information ... ",
          TImages.staticSuccessIllustration);
      //check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      // validate form
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!signUpFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Privacy Policy and Terms of Service  validation can be added here
      if (!privacyPolicy.value) {
         TFullScreenLoader.stopLoading();
        TLoaders.warningSnackbar(
            title: 'Accept Privacy Policy ',
            message:
                'In order to create account , you must accept our Privacy Policy and Terms of Service');
        return;
      }

      // Register user in the Firebase Authentication and Firestore Database
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      // save Authentication user data in the Firebase FireStore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          userName: userName.text.trim(),
          profilePicture: '');

      // final userRepository = Get.put(UserRepository());
      final userRepository = UserRepository.instance;
      await userRepository.saveUserRecord(newUser);

// ✅ Send verification email HERE — user is confirmed logged in at this point
      await AuthenticationRepository.instance.sendEmailVerification();

      //Remove Loader
      TFullScreenLoader.stopLoading();

       // ✅ Navigate FIRST, then show snackbar — avoids overlay glitch
    final userEmail = email.text.trim(); // ✅ save email BEFORE clearing
    Get.off(() => VerifyEmailScreen(email: userEmail)); // ✅ use Get.off not Get.to

      //show  Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created successfully!');

      // Move to verify Email screen
      // Get.to(() => VerifyEmailScreen(email: email.text.trim()));

      // Show success message or navigate to another screen
      // Get.snackbar("Success", "Your account has been created successfully!");
    } catch (e) {
      //Remove  Loader
      TFullScreenLoader.stopLoading();
      // show some Generic Error  to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
    // finally {
    //   //Remove  Loader
    //   TFullScreenLoader.stopLoading();
    // }
  }
}
