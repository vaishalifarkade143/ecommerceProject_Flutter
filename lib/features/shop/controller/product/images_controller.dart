import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  //variables
  RxString selectedProductImages = ''.obs;

  ///get all images from product and variables
  List<String> getAllProductImages(ProductModel product) {
    // Use set to  add unique images only

    Set<String> images = {};
    //Load  thumbnail images
    images.add(product.thumbnail);

    // assign thumbnail as default selected image
    selectedProductImages.value = product.thumbnail;

    //Get all images from product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    //Get all images from product variations if not null
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }
    return images.toList();
  }

//show image popup
  void showEnlargedImages(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.defaultSpace * 2,
                      horizontal: TSizes.defaultSpace),
                  child: CachedNetworkImage(imageUrl: image),
                ),
                SizedBox(height: TSizes.spaceBtwSections),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 150,
                    child: OutlinedButton(
                        onPressed: () => Get.back(),
                        child: const Text("Close")),
                  ),
                )
              ],
            )));
  }
}
