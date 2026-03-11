

// import 'package:ecommerseproject/data/user/user_repository.dart';
// import 'package:ecommerseproject/features/authentication/screens/login/login.dart';
// import 'package:ecommerseproject/features/authentication/screens/onbording/onboarding.dart';
// import 'package:ecommerseproject/features/authentication/screens/signup/widgets/verify_email.dart';
// import 'package:ecommerseproject/features/personalization/model/user_model.dart';
// import 'package:ecommerseproject/navigation_menu.dart';
// import 'package:ecommerseproject/utils/exceptions/firebase_auth_exceptions.dart';
// import 'package:ecommerseproject/utils/exceptions/firebase_exceptions.dart';
// import 'package:ecommerseproject/utils/exceptions/format_exceptions.dart';
// import 'package:ecommerseproject/utils/exceptions/platform_exceptions.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();

//   final deviceStorage = GetStorage();
//   final FirebaseAuth _auth = FirebaseAuth.instance;

// // ✅ v7: use singleton — NO MORE GoogleSignIn() constructor
//   final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
//   bool _googleSignInInitialized = false;

//   /// Called when app launches
//   @override
//   void onReady() {
//     FlutterNativeSplash.remove();
//     screenRedirect();
//   }

//   /// ✅ v7: must call initialize() once before using GoogleSignIn
//   Future<void> _ensureGoogleSignInInitialized() async {
//     if (!_googleSignInInitialized) {
//       await _googleSignIn.initialize();
//       _googleSignInInitialized = true;
//     }
//   }

//   void screenRedirect() async {
//     final user = _auth.currentUser;

//     if (user != null) {
//       // User is logged in
//       if (user.emailVerified) {
//         Get.offAll(() => const NavigationMenu());
//       } else {
//         Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
//       }
//     } else {
//       // No user logged in — check onboarding
//       deviceStorage.writeIfNull('IsFirstTime', true);
//       //check if it's the first time user launches the app
//       deviceStorage.read('IsFirstTime') != true // ✅ != not ==
//           ? Get.offAll(() => const LoginScreen())
//           : Get.offAll(() => const OnBoardingScreen());
//     }
//   }

//   /// [Email Authentication ] - signIn

//   Future<UserCredential> loginWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       return await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       throw TFirebaseAuthExceptions(e.code).message;
//     } on FirebaseException catch (e) {
//       throw TFirebaseExceptions(e.code).message;
//     } on FormatException catch (_) {
//       throw TFormatExceptions().message;
//     } on PlatformException catch (e) {
//       throw TPlatformExceptions(e.code).message;
//     } catch (e) {
//       throw "Something went wrong. Please try again.";
//     }
//   }

//   /// [Email Authentication ] - Register
//   /// Register user with Email & Password
//   Future<UserCredential> registerWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       return await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       // throw e.message ?? "Firebase authentication error";
//       throw TFirebaseAuthExceptions(e.code).message;
//     } on FirebaseException catch (e) {
//       // throw e.message ?? "Firebase error";
//       throw TFirebaseExceptions(e.code).message;
//     } on FormatException catch (_) {
//       // throw "Invalid format";
//       throw TFormatExceptions().message;
//     } on PlatformException catch (e) {
//       // throw e.message ?? "Platform error";
//       throw TPlatformExceptions(e.code).message;
//     } catch (e) {
//       throw "Something went wrong. Please try again.";
//     }
//   }

//   /// [Email verification ] - send verification email
//   Future<void> sendEmailVerification() async {
//     try {
//       return await _auth.currentUser
//           ?.sendEmailVerification(); //current user will automatically fetch using registerWithEmailAndPassword priviously
//     } on FirebaseAuthException catch (e) {
//       // throw e.message ?? "Firebase authentication error";
//       throw TFirebaseAuthExceptions(e.code).message;
//     } on FirebaseException catch (e) {
//       // throw e.message ?? "Firebase error";
//       throw TFirebaseExceptions(e.code).message;
//     } on FormatException catch (_) {
//       // throw "Invalid format";
//       throw TFormatExceptions().message;
//     } on PlatformException catch (e) {
//       // throw e.message ?? "Platform error";
//       throw TPlatformExceptions(e.code).message;
//     } catch (e) {
//       throw "Something went wrong. Please try again.";
//     }
//   }

//   Future<void> sendPasswordResetEmail(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//     } on FirebaseAuthException catch (e) {
//       throw TFirebaseAuthExceptions(e.code).message;
//     } on FirebaseException catch (e) {
//       throw TFirebaseExceptions(e.code).message;
//     } on FormatException catch (_) {
//       throw TFormatExceptions().message;
//     } on PlatformException catch (e) {
//       throw TPlatformExceptions(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again.';
//     }
//   }
  

//   //[Google Authentication ] - Google Sign-In
//   Future<UserCredential?> signInWithGoogle() async {
//     try{
//       // // Trigger the authentication flow
//       // final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
//       // //Obtain the auth details from the request
//       // final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
//       // //Create a new credential
//       // final credentials = GoogleAuthProvider.credential(
//       //   accessToken: googleAuth?.accessToken,
//       //   idToken: googleAuth?.idToken,
//       // );
//       // //Once signed in, return the UserCredential
//       // return await _auth.signInWithCredential(credentials);
//        // ✅ v7: initialize once before use
//       await _ensureGoogleSignInInitialized();

//       // ✅ v7: use authenticate() — signIn() is REMOVED
//       final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

//       // ✅ v7: authentication is now synchronous (no await needed)
//       final GoogleSignInAuthentication googleAuth =
//           googleUser.authentication as GoogleSignInAuthentication;

//       // ✅ v7: get idToken for Firebase — accessToken is now separate
//       // For Firebase Auth, idToken alone is sufficient
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleAuth.idToken,
//       );

//       // Sign in to Firebase with Google credential
//       final UserCredential userCredential =
//           await _auth.signInWithCredential(credential);

//       // Save user data to Firestore so name shows in profile & home appbar
//       final firebaseUser = userCredential.user;
//       if (firebaseUser != null) {
//         final nameParts = (firebaseUser.displayName ?? '').split(' ');
//         final newUser = UserModel(
//           id: firebaseUser.uid,
//           firstName: nameParts.isNotEmpty ? nameParts.first : '',
//           lastName: nameParts.length > 1 ? nameParts.last : '',
//           userName: firebaseUser.displayName ?? '',
//           email: firebaseUser.email ?? '',
//           phoneNumber: firebaseUser.phoneNumber ?? '',
//           profilePicture: firebaseUser.photoURL ?? '',
//         );
//         await UserRepository.instance.saveUserRecord(newUser);
//       }

//       // Navigate to correct screen
//       screenRedirect();

//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       // throw e.message ?? "Firebase authentication error";
//       throw TFirebaseAuthExceptions(e.code).message;
//     } on FirebaseException catch (e) {
//       // throw e.message ?? "Firebase error";
//       throw TFirebaseExceptions(e.code).message;
//     } on FormatException catch (_) {
//       // throw "Invalid format";
//       throw TFormatExceptions().message;
//     } on PlatformException catch (e) {
//       // throw e.message ?? "Platform error";
//       throw TPlatformExceptions(e.code).message;
//     } catch (e) {
//       throw "Something went wrong. Please try again.";
//     }
//   }
//   //[Facebook Authentication] - Facebook Sign-In

  
  
//   /// LogoutUser - Valid for any authentication method
//   Future<void> logout() async {
//     try {

//       await _ensureGoogleSignInInitialized();
//       await _googleSignIn.signOut();
//       await _auth.signOut();
//       Get.offAll(() => const LoginScreen());
//       // return await FirebaseAuth.instance
//       //     .signOut(); //current user will automatically fetch using registerWithEmailAndPassword priviously
//     } on FirebaseAuthException catch (e) {
//       // throw e.message ?? "Firebase authentication error";
//       throw TFirebaseAuthExceptions(e.code).message;
//     } on FirebaseException catch (e) {
//       // throw e.message ?? "Firebase error";
//       throw TFirebaseExceptions(e.code).message;
//     } on FormatException catch (_) {
//       // throw "Invalid format";
//       throw TFormatExceptions().message;
//     } on PlatformException catch (e) {
//       // throw e.message ?? "Platform error";
//       throw TPlatformExceptions(e.code).message;
//     } catch (e) {
//       throw "Something went wrong. Please try again.";
//     }
//   }
// }













import 'package:ecommerseproject/data/user/user_repository.dart';
import 'package:ecommerseproject/features/authentication/screens/login/login.dart';
import 'package:ecommerseproject/features/authentication/screens/onbording/onboarding.dart';
import 'package:ecommerseproject/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:ecommerseproject/features/personalization/model/user_model.dart';
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

  // v7: use singleton
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _googleSignInInitialized = false;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<void> _ensureGoogleSignInInitialized() async {
    if (!_googleSignInInitialized) {
      await _googleSignIn.initialize();
      _googleSignInInitialized = true;
    }
  }

  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      // ✅ Google users are always considered verified — check provider
      final isGoogleUser = user.providerData
          .any((info) => info.providerId == 'google.com');

      if (user.emailVerified || isGoogleUser) {
        // ✅ Fully authenticated — go to home
        Get.offAll(() => const NavigationMenu());
      } else {
        // Email/password user who hasn't verified email yet
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  //-----------------------------------------------------------------------
  // EMAIL & PASSWORD
  //-----------------------------------------------------------------------

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
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions().message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions().message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions().message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  //-----------------------------------------------------------------------
  // GOOGLE SIGN-IN
  //-----------------------------------------------------------------------

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await _ensureGoogleSignInInitialized();

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication as GoogleSignInAuthentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // ✅ Return credential — let LoginController handle navigation
      // screenRedirect() is NOT called here to avoid double navigation
      return userCredential;

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions().message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  //-----------------------------------------------------------------------
  // LOGOUT
  //-----------------------------------------------------------------------

  Future<void> logout() async {
    try {
      await _ensureGoogleSignInInitialized();
      await _googleSignIn.signOut();
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions().message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}