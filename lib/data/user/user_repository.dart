import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/data/repositories/authentication_repository.dart';
import 'package:ecommerseproject/features/personalization/model/user_model.dart';
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

    /// function to fetch user data from Firestore
     Future<UserModel> fetchUserDetails() async {
      try {
            final documentSnapshot  = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
            if(documentSnapshot.exists){
              return UserModel.fromSnapshot(documentSnapshot);
            } else {
              throw UserModel.empty();
            }
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

// function to update user data in Firestore
    Future<void> updateUserDetails(UserModel updatedUser) async{
      try {
        await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
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

    //update single field in user document
    Future<void> updateSingleField(Map<String, dynamic> json) async {
      try {
        await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
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

    Future<void> removeUserRecord(String userId) async {
      try {
        await _db.collection("Users").doc(userId).delete();
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