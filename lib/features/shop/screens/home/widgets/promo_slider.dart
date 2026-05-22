// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:ecommerseproject/common/widgets/custom_shapes/container/circular_container.dart';
// import 'package:ecommerseproject/common/widgets/images/t_rounded_image.dart';
// import 'package:ecommerseproject/features/shop/controller/home_controller.dart';
// import 'package:ecommerseproject/utils/constants/colors.dart';
// import 'package:ecommerseproject/utils/constants/sizes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TPromoSlider extends StatelessWidget {
//   const TPromoSlider({
//     super.key,
//     required this.banners,
//   });

//   final List<String> banners;

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(HomeController());
//     return Column(
//       children: [
//         CarouselSlider(
//           options: CarouselOptions(
//               viewportFraction: 1,
//               onPageChanged: (index, _) =>
//                   controller.updatePageIndicator(index)),
//           items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
//         ),
//         const SizedBox(height: TSizes.spaceBtwItems),
//         Center(
//           child: Obx(
//             () => Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (int i = 0; i < banners.length; i++)
//                   CircularContainer(
//                       width: 15,
//                       height: 3,
//                       backgroundColor:
//                           controller.carouselCurrentIndex.value == i
//                               ? TColors.primary
//                               : TColors.grey,
//                       margin: EdgeInsets.only(right: 10)),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:ecommerseproject/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerseproject/common/widgets/shimmer/shimmer.dart';
import 'package:ecommerseproject/features/shop/controller/bannar_controller.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
//Loader while fetching banners
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }
      //no data found
      if (controller.banners.isEmpty) {
        return const Center(child: Text("No banners available"));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index)),
              items: controller.banners
                  .map((banner) => TRoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList(),

              // items: controller.banners.map((banner) {
              //   return TRoundedImage(
              //     imageUrl: banner.imageUrl,
              //     isNetworkImage:
              //         !banner.isLocalAsset, // ← local = false, network = true
              //     onPressed: () => Get.toNamed(banner.targetScreen),
              //   );
              // }).toList(),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Center(
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      CircularContainer(
                          width: 15,
                          height: 3,
                          backgroundColor:
                              controller.carouselCurrentIndex.value == i
                                  ? TColors.primary
                                  : TColors.grey,
                          margin: EdgeInsets.only(right: 10)),
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}
