import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/features/firebase_services/firebase_storage_services.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/features/shop/model/product_type.dart';
import 'package:ecommerseproject/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Firebase instance for database operations
  final _db = FirebaseFirestore.instance;

  ///Get limited featured products
  ///
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          // .where('IsFeatured', isEqualTo: true)
          .limit(10)
          .get();
      print('📦 Firestore docs returned: ${snapshot.docs.length}'); // ✅ debug

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      // throw 'Something went wrong.Please try again later.';
      throw e.toString(); // ✅ show REAL error not generic message
    }
  }

  ///Get limited featured products
 
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      print('📦 Firestore docs returned in getAllFeaturedProducts: ${snapshot.docs.length}'); // ✅ debug

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      // throw 'Something went wrong.Please try again later.';
      throw e.toString(); // ✅ show REAL error not generic message
    }
  }
// Add these two methods to ProductRepository

  /// Get 1 featured product per category (for home screen popular section)
  Future<List<ProductModel>> getOneProductPerCategory(
      List<String> categoryIds) async {
    try {
      List<ProductModel> result = [];
      for (String categoryId in categoryIds) {
        final snapshot = await _db
            .collection('Products')
            .where('CategoryID', isEqualTo: categoryId)
            .where('IsFeatured', isEqualTo: true)
            .limit(1)
            .get();
        if (snapshot.docs.isNotEmpty) {
          result.add(ProductModel.fromSnapshot(snapshot.docs.first));
        }
      }
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  /// Get ALL products (for View All screen)
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapshot = await _db.collection('Products').get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  // In product_repository.dart — add this method
  Future<List<ProductModel>> getProductsByCategory(String categoryId) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('CategoryID', isEqualTo: categoryId)
          .limit(10)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

// Get Products based on the brands
  Future<List<ProductModel>> fetchProductsByQuery(Query<Object>? query) async {
    try {
      // final snapshot = await _db
      //     .collection('Products')
      //     // .where('IsFeatured', isEqualTo: true)
      //     .limit(10)
      //     .get();
      // print('📦 Firestore docs returned: ${snapshot.docs.length}'); // ✅ debug

      // return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

      final querySnapshot = await query?.get();
      final List<ProductModel> productList = querySnapshot!.docs
          .map((doc) => ProductModel.fromQuerySnapShot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      // throw 'Something went wrong.Please try again later.';
      throw e.toString(); // ✅ show REAL error not generic message
    }
  }

  // ✅ Replace the entire uploadDummyData method with this:
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      for (var product in products) {
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Failed to upload dummy data: $e';
    }
  }
}
