import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/features/shop/model/brand_category_model.dart';
import 'package:ecommerseproject/features/shop/model/brand_model.dart';
import 'package:ecommerseproject/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/format_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/platform_exceptions.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

//to add dummy data to firebase
  
    Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      for (var brand in brands) {
        await _db.collection('Brands').doc(brand.id).set(brand.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions().message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Failed to upload brands: $e';
    }
  }

//To get all brands from firebase
  Future<List<BrandModel>> getAllBrands() async {
  try {
    final snapshot = await _db.collection('Brands').get();
    return snapshot.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
  } on FirebaseException catch (e) {
    throw TFirebaseExceptions(e.code).message;
  } catch (e) {
    throw 'Failed to fetch brands: $e';
  }
}

//to add brands in firebase 
Future<void> uploadBrandCategories(List<BrandCategoryModel> brandCategories) async {
  try {
    for (var bc in brandCategories) {
      await _db.collection('BrandCategory').add(bc.toJson());
    }
  } on FirebaseException catch (e) {
    throw TFirebaseExceptions(e.code).message;
  } catch (e) {
    throw 'Failed to upload brand categories: $e';
  }
}

//Get Brands for Category from firebase
//   Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
//     try {
//       final snapshot = await _db
//           .collection('Brands')
//           .where('categoryIds', arrayContains: categoryId)
//           .get();
//       return snapshot.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
//     } on FirebaseException catch (e) {
//       throw TFirebaseExceptions(e.code).message;
//     } catch (e) {
//       throw 'Failed to fetch brands for category: $e';
//     }
// }

 // Get Brand specific Categories from your data source and return as List<ProductModel>
  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      // final brands =
      //     await brandRepository.getBrandForCategory(categoryId);
      QuerySnapshot brandCategoryQuery = await FirebaseFirestore.instance
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();
      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(10)
          .get();

      List<BrandModel> brands =
          brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return brands;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).code;
    } on PlatformException catch (e) {
      throw TFirebaseExceptions(e.code).code;
    } catch (e) {
     throw 'Failed to fetch brands for category: $e';
    }
  }
}