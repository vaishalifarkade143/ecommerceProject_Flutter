import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/features/firebase_services/firebase_storage_services.dart';
import 'package:ecommerseproject/features/shop/model/category_model.dart';
import 'package:ecommerseproject/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/format_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  ///variable to hold the list of categories
  final _db = FirebaseFirestore.instance;

  /// Get all categories from Firestore
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapShot = await _db.collection("Categories").get();
      final list = snapShot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions().message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw "Something wrong. Please try again.";
    }
  }

  //Get Sub Categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
  try {
    final snapshot = await _db
        .collection('Categories')
        .where('ParentId', isEqualTo: categoryId)
        .get();
        final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
        return result;
   
  } on FirebaseException catch (e) {
    throw TFirebaseExceptions(e.code).message;
  } on FormatException catch (_) {
    throw TFormatExceptions().message;
  } on PlatformException catch (e) {
    throw TPlatformExceptions(e.code).message;
  } catch (e) {
    throw ' Get Sub Categories data: $e';
  }
}
  

Future<void> uploadDummyData(List<CategoryModel> categories) async {
  try {
    for (var category in categories) {
      // ✅ Save directly to Firestore — no Storage upload needed
      // because image is already a network URL
      await _db
          .collection('Categories')
          .doc(category.id)
          .set(category.toJson());
    }
  } on FirebaseException catch (e) {
    throw TFirebaseExceptions(e.code).message;
  } on FormatException catch (_) {
    throw TFormatExceptions().message;
  } on PlatformException catch (e) {
    throw TPlatformExceptions(e.code).message;
  } catch (e) {
    throw 'Failed to upload dummy data: $e';
  }
}


}
