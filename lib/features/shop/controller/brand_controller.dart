

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/data/repositories/brand/brand_repository.dart';
import 'package:ecommerseproject/data/repositories/product/product_repository.dart';
import 'package:ecommerseproject/features/shop/model/brand_model.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final isLoading = false.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final _db = FirebaseFirestore.instance;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    fetchFeaturedBrands();
    super.onInit();
  }

  Future<void> fetchFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      //stop Loader
      isLoading.value = false;
    }
  }

  // Get Brand specific Categories from your data source and return as List<ProductModel>
  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      final brands =
          await brandRepository.getBrandForCategory(categoryId,);
    
      return brands;
    }  catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }

  // Get Brand specific Products from your data source and return as List<ProductModel>
  Future<List<ProductModel>> getBrandProducts({required String brandId ,  int limit = -1}) async {
    try {
      final products =
          await ProductRepository.instance.getProductForBrand(brandId: brandId , limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }
}
