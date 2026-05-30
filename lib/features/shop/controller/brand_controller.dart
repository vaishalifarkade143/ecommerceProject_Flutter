// import 'package:ecommerseproject/data/repositories/brand/brand_repository.dart';
// import 'package:ecommerseproject/features/shop/model/brand_model.dart';
// import 'package:ecommerseproject/utils/popups/loader.dart';
// import 'package:get/get.dart';

// class BrandController extends GetxController{
//   static BrandController get instance => Get.find();
//   RxBool isLoading =  true.obs;
//   final RxList<BrandModel> allBrands = <BrandModel>[].obs;
//   final RxList<BrandModel> featueredBrands = <BrandModel>[].obs;
//   final brandRepository =Get.put(BrandRepository());

//   @override
//   void onInit(){
//     getFeaturedBrands();
//       super.onInit();
//   }

//   Future<void> getFeaturedBrands() async {

//     try {
//       //show loader while loading brands
//       isLoading.value = true;
//       final brands =  await brandRepository.getAllBrands();
//       allBrands.assignAll(brands);
//       featueredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));
//       isLoading.value = false;

//     } catch (e) {
//      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString);

//     } finally {
//       isLoading.value = false;
//     }
//   }

// }

import 'package:ecommerseproject/data/repositories/brand/brand_repository.dart';
import 'package:ecommerseproject/data/repositories/product/product_repository.dart';
import 'package:ecommerseproject/features/shop/model/brand_model.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final isLoading = false.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  final _brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    fetchFeaturedBrands();
    super.onInit();
  }

  Future<void> fetchFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await _brandRepository.getAllBrands();
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

  // Get Brand specific Products from your data source and return as List<ProductModel>
  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products =
          await ProductRepository.instance.getProductForBrand(brandId : brandId);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }
}
