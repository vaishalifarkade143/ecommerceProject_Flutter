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
          .where('IsFeatured', isEqualTo: true)
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

  ///Upload dummy products data tothe Cloude Firestore
  // Future<void> uploadDummyData(List<ProductModel> products) async {
  //   try {
  //     //Upload all products along with their images
  //     final storage = Get.put(TFirebaseStorageService());
  //     //Loop through each product and upload to firestore
  //     for (var product in products) {
  //       //Get image data link from local assets
  //       final thumbnail =
  //           await storage.getImageDateFromAssets(product.thumbnail);
  //       // Upload image data link from local assets
  //       final url = await storage.uploadImageData(
  //           'Products/Images', thumbnail, product.thumbnail.toString());
  //       //Assign URL to Product.thumbnail attribute
  //       product.thumbnail = url;

  //       // Product list of images
  //       if (product.images != null && product.images!.isNotEmpty) {
  //         List<String> imageUrl = [];
  //         for (var image in product.images!) {
  //           //Get image data link from local assets
  //           final assetImage = await storage.getImageDateFromAssets(image);
  //           // Upload image data link from local assets
  //           final url = await storage.uploadImageData(
  //               'Products/Images', assetImage, image);
  //           //Assign URL to image list
  //           imageUrl.add(url);
  //         }
  //         product.images!.clear();
  //         product.images!.addAll(imageUrl);
  //       }
  //       //Upload varient images
  //       if (product.productType == ProductType.variable.tostring()) {
  //         for (var variation in product.productVariations!) {
  //           //Get image data link from local assets
  //           final assetImage =
  //               await storage.getImageDateFromAssets(variation.image);
  //           // Upload image data link from local assets
  //           final url = await storage.uploadImageData(
  //               'Products/Images', assetImage, variation.image);
  //           //Assign URL to image list
  //           variation.image = url;
  //         }
  //       }
  //       //Store product in firesore
  //       await _db.collection('Products').doc(product.id).set(product.toJson());
  //     }
  //   } on FirebaseException catch (e) {
  //     throw e.message!;
  //   } on SocketException catch (e) {
  //     throw e.message;
  //   } on PlatformException catch (e) {
  //     throw e.message!;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

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
