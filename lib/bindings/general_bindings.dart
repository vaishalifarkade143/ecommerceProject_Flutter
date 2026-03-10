


import 'package:ecommerseproject/data/user/user_repository.dart';
import 'package:ecommerseproject/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(UserRepository());
    // Other general dependencies can be added here
  }

}