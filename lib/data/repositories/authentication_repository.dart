

import 'package:ecommerseproject/features/authentication/screens/login/login.dart';
import 'package:ecommerseproject/features/authentication/screens/onbording/onboarding.dart';
import 'package:ecommerseproject/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:ecommerseproject/navigation_menu.dart';
import 'package:ecommerseproject/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/format_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      deviceStorage.read('IsFirstTime') != true // ✅ != not ==
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /// [Email Authentication ] - signIn

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions().message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }

  /// [Email Authentication ] - Register
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

  /// [Email Authentication ] - forgot password
  /// [Google Authentication ] - Google
  /// [Facebook Authentication] - FACEBOOK
  /// [Phone Authentication ] - Phone Number
  /// LogoutUser - Valid for any authentication method
  Future<void> logout() async {
    try {
      return await FirebaseAuth.instance
          .signOut(); //current user will automatically fetch using registerWithEmailAndPassword priviously
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

  //[Google Authentication ] - Google Sign-In
  Future<UserCredential?> signInWithGoogle() async {
    try{
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccont = await GoogleSignIn().signIn();
      //Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccont?.authentication;
      //Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      //Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
      
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
  //[Facebook Authentication] - Facebook Sign-In
}
