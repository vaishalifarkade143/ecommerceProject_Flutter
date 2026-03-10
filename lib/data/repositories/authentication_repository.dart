// import 'package:ecommerseproject/features/authentication/screens/login/login.dart';
// import 'package:ecommerseproject/features/authentication/screens/onbording/onboarding.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();

//   /// Variables
//   final deviceStorage = GetStorage();
//   final FirebaseAuth  _auth = FirebaseAuth.instance;

//   /// call from main.dart on app launch
//   @override
//   void onReady() {
//     FlutterNativeSplash.remove();
//     screenRedirect();
//   }

//   /// Function to show relavent screen according to the auth state of user
//   void screenRedirect() async {
//     ///Local Storage Data
//      if(kDebugMode){
//       print('============= Get Storage Data =============');
//       print('Is First Time : ${deviceStorage.read('IsFirstTime')}');
//       print(deviceStorage.read('IsFirstTime'));
//      }
//     deviceStorage.writeIfNull('IsFirstTime', true);
//     deviceStorage.read('IsFirstTime') != true
//         ? Get.offAll(() => const LoginScreen())
//         : Get.offAll(() => const OnBoardingScreen());

//         /// [Email Authentication ] - signIn
//         /// [Email Authentication ] - Register
//         ///
//         // Future<UserCredential> registerwithEmailAndPassword(String email, String password) async {
//         //   try {
//         //     return await _auth.createUserWithEmailAndPassword(email: email, password: password);
//         //   } on FirebaseAuthException catch (e) {
//         //     throw TFirebaseAuthException(e.code).message;
//         //   } on FirebaseException catch (e) {
//         //     throw TFirebaseException(e.code).message;
//         //   } on FormatException catch (_) {
//         //     throw  TFormatException();
//         //   } on PlatformException catch (e) {
//         //     throw TPlatformException(e.code).message;
//         //   }

//         //     catch (e) {
//         //     throw "Something went wrong . please try again";
//         //   }
//         // }

//  /// Register User with Email & Password
//   Future<UserCredential> registerWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       return await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       throw e.message ?? "Firebase authentication error";
//     } on FirebaseException catch (e) {
//       throw e.message ?? "Firebase error";
//     } on FormatException {
//       throw "Invalid format";
//     } on PlatformException catch (e) {
//       throw e.message ?? "Platform error";
//     } catch (e) {
//       throw "Something went wrong. Please try again.";
//     }
//   }

//         /// [Email Authentication ] - forgot password
//         /// [Google Authentication ] - Google
//         /// [Facebook Authentication] - FACEBOOK
//         /// [Phone Authentication ] - Phone Number
//   }

// }









import 'package:ecommerseproject/features/authentication/screens/login/login.dart';
import 'package:ecommerseproject/features/authentication/screens/onbording/onboarding.dart';
import 'package:ecommerseproject/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:ecommerseproject/navigation_menu.dart';
import 'package:ecommerseproject/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/format_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Called when app launches
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Redirect user based on onboarding state
  // void screenRedirect() async {
  //   final user = _auth.currentUser;
  //    if (kDebugMode) {
  //     print('============= Get Storage Data =============');
  //     print('Is First Time : ${deviceStorage.read('IsFirstTime')}');
  //   }
  //   if (user != null) {
  //     if (user.emailVerified) {
  //       Get.offAll(() => const NavigationMenu());
  //     }
  //     else{
  //       Get.offAll(() =>  VerifyEmailScreen(email: _auth.currentUser?.email,));
  //     }
  //     if (kDebugMode) {
  //     print('============= Get Storage Data =============');
  //     print('Is First Time : ${deviceStorage.read('IsFirstTime')}');
  //   }

  //   deviceStorage.writeIfNull('IsFirstTime', true);

  //   deviceStorage.read('IsFirstTime') == true
  //       ? Get.offAll(() => const LoginScreen())
  //       : Get.offAll(() => const OnBoardingScreen());
  //   }
  // }


  void screenRedirect() async {
  final user = _auth.currentUser;

  if (user != null) {
    // User is logged in
    if (user.emailVerified) {
      Get.offAll(() => const NavigationMenu());
    } else {
      Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
    }
  } else {
    // No user logged in — check onboarding
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true   // ✅ != not ==
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }
}



  /// Register user with Email & Password
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // throw e.message ?? "Firebase authentication error";
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      // throw e.message ?? "Firebase error";
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      // throw "Invalid format";
      throw TFormatExceptions().message;
    } on PlatformException catch (e) {
      // throw e.message ?? "Platform error";
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }

  /// [Email verification ] - send verification email
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser
          ?.sendEmailVerification(); //current user will automatically fetch using registerWithEmailAndPassword priviously
    } on FirebaseAuthException catch (e) {
      // throw e.message ?? "Firebase authentication error";
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      // throw e.message ?? "Firebase error";
      throw TFirebaseExceptions(e.code).message;
    }on FormatException catch (_) {
      // throw "Invalid format";
      throw TFormatExceptions().message;
    } on PlatformException catch (e) {
      // throw e.message ?? "Platform error";
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }

  /// [Email Authentication ] - forgot password
  /// [Google Authentication ] - Google
  /// [Facebook Authentication] - FACEBOOK
  /// [Phone Authentication ] - Phone Number
  /// LogoutUser - Valid for any authentication method
   Future<void> logout() async {
    try {
      return await FirebaseAuth.instance.signOut(); //current user will automatically fetch using registerWithEmailAndPassword priviously
    } on FirebaseAuthException catch (e) {
      // throw e.message ?? "Firebase authentication error";
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      // throw e.message ?? "Firebase error";
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      // throw "Invalid format";
      throw TFormatExceptions().message;
    }  on PlatformException catch (e) {
      // throw e.message ?? "Platform error";
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }
}
