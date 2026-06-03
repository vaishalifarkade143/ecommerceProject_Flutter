import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/features/firebase_services/firebase_storage_services.dart';
import 'package:ecommerseproject/features/shop/model/product_category_model.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/features/shop/model/product_type.dart';
import 'package:ecommerseproject/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/platform_exceptions.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
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

  //add productCategory to firebase
  Future<void> uploadProductCategories(
      List<ProductCategoryModel> productCategories) async {
    try {
      for (var pc in productCategories) {
        await _db.collection('ProductCategory').add(pc.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'Failed to upload product categories: $e';
    }
  }

  ///Get limited featured products

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      print(
          '📦 Firestore docs returned in getAllFeaturedProducts: ${snapshot.docs.length}'); // ✅ debug

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
  Future<List<ProductModel>> getProductsByCategory(int limit,
      {required String categoryId}) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('CategoryID', isEqualTo: categoryId)
          .limit(limit)
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

  Future<List<ProductModel>> getProductForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();
      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ProductModel>> getProductForCategory({
    required String categoryId,
    int limit = 4,
  }) async {
    try {
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['productId'] as String)
          .toList();
          
      final productsQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      List<ProductModel> products = productsQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again later. Error: $e';
    }
  }

  ///Get Brand Specific Products from your data source
  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products =
          await ProductRepository.instance.getProductForBrand(brandId: brandId);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
