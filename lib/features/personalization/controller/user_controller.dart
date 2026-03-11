import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/features/personalization/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final Rx<UserModel> user = UserModel.empty().obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      isLoading.value = true;
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) return;

      final doc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .get();

      user.value = UserModel.fromSnapshot(doc);
    } catch (e) {
      user.value = UserModel.empty();
    } finally {
      isLoading.value = false;
    }
  }
}