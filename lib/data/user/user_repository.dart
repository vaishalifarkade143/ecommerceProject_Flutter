import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/features/personalization/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
 

    
    /// function to save userdata in the Firestore
    Future<void> saveUserRecord(UserModel user) async {
      try {
        await _db.collection("Users").doc(user.id).set(user.toJson());
      } on FirebaseException catch (e) {
        throw e.message ?? "Firebase error";
      } on FormatException catch (_) {
        throw "Invalid format";
      } on PlatformException catch (e) {
        throw e.message ?? "Platform error";
      } catch (e) {
        throw "Something went wrong. Please try again.";
      }
    }

}
