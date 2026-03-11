// import 'dart:async';

// import 'package:ecommerseproject/common/widgets/success_screen/success_screen.dart';
// import 'package:ecommerseproject/data/repositories/authentication_repository.dart';
// import 'package:ecommerseproject/utils/constants/image_strings.dart';
// import 'package:ecommerseproject/utils/constants/text_strings.dart';
// import 'package:ecommerseproject/utils/popups/loader.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class VerifyEmailController extends GetxController {
//   static VerifyEmailController get instance => Get.find();

//   // variables and methods for handling email verification logic will go here
//   Timer? _verificationTimer; // ✅ keep a reference to cancel it
  
//   @override
//   void onInit() {
//     super.onInit();
//     // sendEmailVerification();
//     setTimerForAutoRedirection();
//   }


//   @override
//   void onClose() {
//     _verificationTimer?.cancel(); // ✅ cancel timer when controller is destroyed
//     super.onClose();
//   }


//   /// send email verification link
//   Future<void> sendEmailVerification() async {
//     try {
//       await AuthenticationRepository.instance.sendEmailVerification();
//       TLoaders.successSnackBar(
//           title: "Email Sent",
//           message: "Please check your email to verify your account.");
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh snap !', message: e.toString());
//       // Get.snackbar("Error", "Failed to send verification email. Please try again.");
//     }
//   }

//   /// Timer to acutomatically check email verification status every 5 seconds



//    void setTimerForAutoRedirection() {
//     _verificationTimer = Timer.periodic(
//       const Duration(seconds: 3), // ✅ use 3s, not 1s — less hammering Firebase
//       (timer) async {
//         final user = FirebaseAuth.instance.currentUser;

//         // ✅ Stop timer immediately if user signed out
//         if (user == null) {
//           timer.cancel();
//           return;
//         }

//         try {
//           await user.reload();
//           final refreshedUser = FirebaseAuth.instance.currentUser;
//           if (refreshedUser?.emailVerified ?? false) {
//             timer.cancel();
//             _goToSuccessScreen();
//           }
//         } catch (e) {
//           timer.cancel(); // ✅ stop on any auth error
//         }
//       },
//     );
//   }

//   /// manually check email verification status
//  Future<void> checkEmailVarificationStatus() async {
//     final user = FirebaseAuth.instance.currentUser;

//     // ✅ Guard: no user = nothing to check
//     if (user == null) {
//       TLoaders.warningSnackbar(
//         title: 'Not Signed In',
//         message: 'Please sign in again.',
//       );
//       return;
//     }

//     try {
//       await user.reload(); // ✅ get fresh status
//       final refreshedUser = FirebaseAuth.instance.currentUser;
//       if (refreshedUser != null && refreshedUser.emailVerified) {
//         _verificationTimer?.cancel();
//         _goToSuccessScreen();
//       } else {
//         TLoaders.warningSnackbar(
//           title: 'Email Not Verified',
//           message: 'Please verify your email first, then tap Continue.',
//         );
//       }
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Error', message: e.toString());
//     }
//   }


// // varify_email_controller.dart
// // Future<void> checkEmailVarificationStatus() async {
// //   final currentUser = FirebaseAuth.instance.currentUser;

// //   await currentUser?.reload(); // ✅ MUST reload to get fresh data from Firebase

// //   final refreshedUser = FirebaseAuth.instance.currentUser;
// //   if (refreshedUser != null && refreshedUser.emailVerified) {
// //     Get.off(
// //       () => SuccessScreen(
// //         image: TImages.successfullyRegisterAnimation,
// //         title: TTexts.yourAccountCreatedTilte,
// //         subtitle: TTexts.yourAccountCreatedSubTilte,
// //         onPressed: () => AuthenticationRepository.instance.screenRedirect(),
// //       ),
// //     );
// //   } else {
// //     // ✅ Tell user email not verified yet
// //     TLoaders.warningSnackbar(
// //       title: 'Email Not Verified',
// //       message: 'Please verify your email first, then tap Continue.',
// //     );
// //   }
// // }

//  void _goToSuccessScreen() {
//     Get.off(
//       () => SuccessScreen(
//         image: TImages.successfullyRegisterAnimation,
//         title: TTexts.yourAccountCreatedTilte,
//         subtitle: TTexts.yourAccountCreatedSubTilte,
//         onPressed: () => AuthenticationRepository.instance.screenRedirect(),
//       ),
//     );
//   }
// }



import 'dart:async';

import 'package:ecommerseproject/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerseproject/data/repositories/authentication_repository.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // variables and methods for handling email verification logic will go here
  Timer? _verificationTimer; // ✅ keep a reference to cancel it
  
  @override
  void onInit() {
    super.onInit();
    // sendEmailVerification();
    setTimerForAutoRedirection();
  }


  @override
  void onClose() {
    _verificationTimer?.cancel(); // ✅ cancel timer when controller is destroyed
    super.onClose();
  }


  /// send email verification link
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: "Email Sent",
          message: "Please check your email to verify your account.");
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap !', message: e.toString());
      // Get.snackbar("Error", "Failed to send verification email. Please try again.");
    }
  }

  /// Timer to acutomatically check email verification status every 5 seconds

   void setTimerForAutoRedirection() {
    _verificationTimer = Timer.periodic(
      const Duration(seconds: 3), // ✅ use 3s, not 1s — less hammering Firebase
      (timer) async {
        final user = FirebaseAuth.instance.currentUser;

        // ✅ Stop timer immediately if user signed out
        if (user == null) {
          timer.cancel();
          return;
        }

        try {
          await user.reload();
          final refreshedUser = FirebaseAuth.instance.currentUser;
          if (refreshedUser?.emailVerified ?? false) {
            timer.cancel();
            _goToSuccessScreen();
          }
        } catch (e) {
          timer.cancel(); // ✅ stop on any auth error
        }
      },
    );
  }

  /// manually check email verification status
 Future<void> checkEmailVarificationStatus() async {
    final user = FirebaseAuth.instance.currentUser;

    // ✅ Guard: no user = nothing to check
    if (user == null) {
      TLoaders.warningSnackbar(
        title: 'Not Signed In',
        message: 'Please sign in again.',
      );
      return;
    }

    try {
      await user.reload(); // ✅ get fresh status
      final refreshedUser = FirebaseAuth.instance.currentUser;
      if (refreshedUser != null && refreshedUser.emailVerified) {
        _verificationTimer?.cancel();
        _goToSuccessScreen();
      } else {
        TLoaders.warningSnackbar(
          title: 'Email Not Verified',
          message: 'Please verify your email first, then tap Continue.',
        );
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }


 void _goToSuccessScreen() {
    Get.off(
      () => SuccessScreen(
        image: TImages.successfullyRegisterAnimation,
        title: TTexts.yourAccountCreatedTilte,
        subtitle: TTexts.yourAccountCreatedSubTilte,
        onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      ),
    );
  }


}


