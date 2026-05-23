import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerseproject/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommerseproject/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerseproject/features/shop/controller/product/images_controller.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return CurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadious),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImages.value;
                    // return Image(image: AssetImage(TImages.productImage5));
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImages(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: TColors.primary),
                      ),
                    );
                  })
                  ),
                )),

            //Image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(
                    () {
                      final imageSelected =
                          controller.selectedProductImages.value ==
                              images[index];
                      return TRoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        border: Border.all(
                          color: imageSelected
                              ? TColors.primary
                              : Colors.transparent,
                          width: imageSelected ? 2 : 1,
                        ),
                        padding: const EdgeInsets.all(TSizes.sm),
                        imageUrl: images[index],
                        onPressed: () => controller
                            .selectedProductImages.value = images[index],
                      );
                    },
                  ),
                ),
              ),
            ),

            //Appbar Icons
            TAppBar(showBackArrow: true, actions: [
              TCircularIcon(
                icon: Iconsax.heart,
                color: Colors.red,
              )
            ])
          ],
        ),
      ),
    );
  }
}
