import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/features/shop/model/brand_model.dart';
import 'package:ecommerseproject/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/format_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/platform_exceptions.dart';
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

  // Future<List<BrandModel>> getAllBrands() async {
  //   try {
  //     final snapshot = await _db.collection('Brands').get();
  //     final result =  snapshot.docs
  //         .map((e) => BrandModel.fromSnapshot(e)).toList();
  //         return result;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseExceptions(e.code).message;
  //   } on FormatException catch (_) {
  //     throw TFormatExceptions().message;
  //   } on PlatformException catch (e) {
  //     throw TPlatformExceptions(e.code).message;
  //   } catch (e) {
  //     throw 'Failed to fetch brands: $e';
  //   }
  // }

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
}
