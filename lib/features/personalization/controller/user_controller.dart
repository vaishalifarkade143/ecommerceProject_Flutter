import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/data/user/user_repository.dart';
import 'package:ecommerseproject/features/personalization/model/user_model.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  final Rx<UserModel> user = UserModel.empty().obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  ///Save user data to from any registeration Provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        //convert Name to first and last name
        final nameParts =
            UserModel.nameParts(userCredentials.user?.displayName ?? '');
        final userName =
            UserModel.generateUsername(userCredentials.user?.displayName ?? '');
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
    } catch (e) {
      TLoaders.warningSnackbar(
          title: "Data not saved",
          message:
              'Something went wrong while saving your information. Please try again later.');
    }
  }

  Future<void> fetchUserData() async {
    try {
      isLoading.value = true;
      final uid = FirebaseAuth.instance.currentUser?.uid;
      // if (uid == null) return;
       if (uid == null) {
        user.value = UserModel.empty();
        return;
      }

      final doc =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();

      user.value = UserModel.fromSnapshot(doc);
    } catch (e) {
      user.value = UserModel.empty();
    } finally {
      isLoading.value = false;
    }
  }

   /// ✅ Call this on logout to wipe stale cached user data immediately
  void clearUser() {
    user.value = UserModel.empty();
  }

}
