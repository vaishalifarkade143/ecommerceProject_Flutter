import 'package:ecommerseproject/data/repositories/brand/brand_repository.dart';
import 'package:ecommerseproject/data/repositories/product/product_repository.dart';
import 'package:ecommerseproject/data/user/user_repository.dart';
import 'package:ecommerseproject/features/personalization/controller/user_controller.dart';
import 'package:ecommerseproject/features/shop/controller/brand_controller.dart';
import 'package:ecommerseproject/features/shop/controller/product/images_controller.dart';
import 'package:ecommerseproject/features/shop/controller/product/product_controller.dart';
import 'package:ecommerseproject/features/shop/controller/product/variation_controller.dart';
import 'package:ecommerseproject/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(UserRepository());
    Get.put(ProductRepository()); // ✅ registered FIRST
    Get.put(UserController());
    Get.put(ProductController()); // ✅ lazyPut — only created when needed
    // In general_bindings.dart
    Get.lazyPut(() => VariationController());
    Get.lazyPut(() => ImagesController());
    Get.put(BrandRepository());
  Get.put(BrandController());
  
  }
}
