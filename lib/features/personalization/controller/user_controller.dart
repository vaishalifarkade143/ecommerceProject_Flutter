// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerseproject/data/user/user_repository.dart';
// import 'package:ecommerseproject/features/personalization/model/user_model.dart';
// import 'package:ecommerseproject/utils/popups/loader.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class UserController extends GetxController {
//   static UserController get instance => Get.find();
//   final userRepository = Get.put(UserRepository());

//   final Rx<UserModel> user = UserModel.empty().obs;
//   final isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserData();
//   }

//   ///Save user data to from any registeration Provider
//   Future<void> saveUserRecord(UserCredential? userCredentials) async {
//     try {
//       if (userCredentials != null) {
//         //convert Name to first and last name
//         final nameParts =
//             UserModel.nameParts(userCredentials.user?.displayName ?? '');
//         final userName =
//             UserModel.generateUsername(userCredentials.user?.displayName ?? '');
//         final newUser = UserModel(
//             id: userCredentials.user!.uid,
//             firstName: nameParts[0],
//             lastName:
//                 nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
//             userName: userName,
//             email: userCredentials.user!.email ?? '',
//             phoneNumber: userCredentials.user!.phoneNumber ?? '',
//             profilePicture: userCredentials.user?.photoURL ?? '');

//             //save user data to Firestore
//         await userRepository.saveUserRecord(newUser);
//         // ✅ Update local cache immediately — don't wait for Firestore round-trip
//         user.value = newUser;
//       }
//     } catch (e) {
//       TLoaders.warningSnackbar(
//           title: "Data not saved",
//           message:
//               'Something went wrong while saving your information. Please try again later.');
//     }
//   }

//   Future<void> fetchUserData() async {
//     try {
//       isLoading.value = true;
//       final uid = FirebaseAuth.instance.currentUser?.uid;
//       // if (uid == null) return;
//        if (uid == null) {
//         user.value = UserModel.empty();
//         return;
//       }

//       final doc =
//           await FirebaseFirestore.instance.collection('Users').doc(uid).get();

//       user.value = UserModel.fromSnapshot(doc);
//     } catch (e) {
//       user.value = UserModel.empty();
//     } finally {
//       isLoading.value = false;
//     }
//   }

//    /// ✅ Call this on logout to wipe stale cached user data immediately
//   void clearUser() {
//     user.value = UserModel.empty();
//   }

// }

import 'package:ecommerseproject/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerseproject/data/user/user_repository.dart';
import 'package:ecommerseproject/features/authentication/screens/login/login.dart';
import 'package:ecommerseproject/features/personalization/model/user_model.dart';
import 'package:ecommerseproject/features/personalization/screen/profile/profile.dart';
import 'package:ecommerseproject/features/personalization/screen/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/network_manager.dart';
import 'package:ecommerseproject/utils/popups/full_screen_loader.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  final Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFromKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  ///Save user data to from any registeration Provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      //Refresh user record .First update Rx User and then check if user data is already stored. If not store new data
      await fetchUserRecord();

      //If no record already stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          //convert Name to first and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user?.displayName ?? '');
          final userName = UserModel.generateUsername(
              userCredentials.user?.displayName ?? '');
          final newUser = UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              userName: userName,
              email: userCredentials.user!.email ?? '',
              phoneNumber: userCredentials.user!.phoneNumber ?? '',
              profilePicture: userCredentials.user?.photoURL ?? '');

          //save user data to Firestore
          await userRepository.saveUserRecord(newUser);
          // ✅ Update local cache immediately — don't wait for Firestore round-trip
          user.value = newUser;
        }
      }
    } catch (e) {
      TLoaders.warningSnackbar(
          title: "Data not saved",
          message:
              'Something went wrong while saving your information. Please try again later.');
    }
  }

//Fetch user data to show in the app
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// ✅ Call this on logout to wipe stale cached user data immediately
  void clearUser() {
    user.value = UserModel.empty();
  }

  //delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account? This action cannot be undone.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: TSizes.lg,
            ),
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            )),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey)),
        child: const Text('Cancel'),
      ),
    );
  }

  //delete user account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing...', TImages.staticSuccessIllustration);

      ///First re-authenticate the user before deleting the account
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //Revarify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }

  //-- RE-AUTHENTICATE USER BEFORE SENSITIVE ACTIONS (like delete account, change email, change password)
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Re-authenticating user...', TImages.staticSuccessIllustration);

      //check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFromKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      TFullScreenLoader.stopLoading();
      // TLoaders.successSnackBar(title: 'Success', message: 'User re-authenticated successfully.');
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }

  /// UploadUserProfile Image 
  Future<void> uploadUserProfilePicture() async {
    try{
    final image  = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxHeight: 512,
      maxWidth: 512,
      );
      if(image != null){
        imageUploading.value = true;
         //upload image 
         final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);
         //update user Image Record
         Map<String, dynamic> json = {
          'ProfilePicture' : imageUrl
         };
         await userRepository.updateSingleField(json);
         user.value.profilePicture = imageUrl;
         user.refresh();
         TLoaders.successSnackBar(title: 'Congratulations', message: 'Profile picture updated successfully');
      }
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh snap!', message:'Something went wrong: $e');
    }finally{
      imageUploading.value = false;
    }
  }
}
