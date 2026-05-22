// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerseproject/features/shop/model/banner_model.dart';
// import 'package:ecommerseproject/utils/exceptions/firebase_exceptions.dart';
// import 'package:ecommerseproject/utils/exceptions/format_exceptions.dart';
// import 'package:ecommerseproject/utils/exceptions/platform_exceptions.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class BannerRepository extends GetxController {
//   static BannerRepository get instance => Get.find();

//   //variables
//   final _db = FirebaseFirestore.instance;

//   //Get all order related to current user
//   Future<List<BannerModel>> fetchBanners() async {
//     try {
//       final result = await _db
//           .collection('Banners')
//           .where('active', isEqualTo: true)
//           .get();
//       return result.docs
//           .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
//           .toList();
//     } on FirebaseException catch (e) {
//       throw TFirebaseExceptions(e.code).message;
//     } on FormatException catch (_) {
//       throw TFormatExceptions().message;
//     } on PlatformException catch (e) {
//       throw TPlatformExceptions(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again.';
//     }
//   }

//   /// Upload Banners to cloude firestore
// }








import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/features/firebase_services/firebase_storage_services.dart';
import 'package:ecommerseproject/features/shop/model/banner_model.dart';
import 'package:ecommerseproject/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/format_exceptions.dart';
import 'package:ecommerseproject/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanners() async {
    try {
      // Fetch ALL banners first (no filter) so we can debug
      final result = await _db.collection('Banners').get();

      // Print how many docs found
      print('🔥 Total docs in Banners collection: ${result.docs.length}');

      // Print each document's raw data
      for (var doc in result.docs) {
        print('📄 Document ID: ${doc.id}');
        print('📦 Data: ${doc.data()}');
      }

      // Filter active banners manually (handles both 'active' and 'Active')
      final activeBanners = result.docs.where((doc) {
        final data = doc.data();
        // Check both lowercase and uppercase field name
        final isActive = data['active'] ?? data['Active'] ?? false;
        print('✅ Banner active status: $isActive');
        return isActive == true;
      }).toList();

      print('🎯 Active banners count: ${activeBanners.length}');

      return activeBanners
          .map((doc) => BannerModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      print('❌ FirebaseException: ${e.code} - ${e.message}');
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions().message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      print('❌ General error: $e');
      throw 'Something went wrong. Please try again.';
    }
  }

  // Inside BannerRepository class, ADD this method:
Future<void> uploadDummyData(List<BannerModel> banners) async {
  try {
    final storage = Get.put(TFirebaseStorageService());
    for (var banner in banners) {
      // Get image from local assets and upload to Firebase Storage
      final file = await storage.getImageDateFromAssets(banner.imageUrl);
      final url = await storage.uploadImageData('Banners', file, banner.imageUrl);
      // Update banner with the storage URL
      banner.imageUrl = url;
      // Save to Firestore (auto-generated doc ID)
      await _db.collection('Banners').add(banner.toJson());
    }
  } on FirebaseException catch (e) {
    throw TFirebaseExceptions(e.code).message;
  } on PlatformException catch (e) {
    throw TPlatformExceptions(e.code).message;
  } catch (e) {
    throw 'Failed to upload banners: $e';
  }
}
}