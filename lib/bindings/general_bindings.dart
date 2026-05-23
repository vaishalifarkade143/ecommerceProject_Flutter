// import 'package:ecommerseproject/data/repositories/product/product_repository.dart';
// import 'package:ecommerseproject/data/user/user_repository.dart';
// import 'package:ecommerseproject/features/personalization/controller/user_controller.dart';
// import 'package:ecommerseproject/features/shop/controller/product_controller.dart';
// import 'package:ecommerseproject/utils/helpers/network_manager.dart';
// import 'package:get/get.dart';

// class GeneralBindings extends Bindings {
//   @override
//   void dependencies() {
//     Get.put(NetworkManager());
//     Get.put(UserRepository());
//     Get.put(UserController());
//     // Other general dependencies can be added here
//     Get.put(ProductRepository()); // ✅ ADD
//     Get.put(ProductController()); // ✅ ADD
//   }
// }

import 'package:ecommerseproject/data/repositories/product/product_repository.dart';
import 'package:ecommerseproject/data/user/user_repository.dart';
import 'package:ecommerseproject/features/personalization/controller/user_controller.dart';
import 'package:ecommerseproject/features/shop/controller/product_controller.dart';
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
  }
}
