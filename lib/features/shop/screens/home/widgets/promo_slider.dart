import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:ecommerseproject/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerseproject/features/shop/controller/home_controller.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
          items: [
            TRoundedImage(
              imageUrl: TImages.promoBanner1,
            ),
            TRoundedImage(
              imageUrl: TImages.promoBanner2,
            ),
            TRoundedImage(
              imageUrl: TImages.promoBanner3,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  CircularContainer(
                      width: 15,
                      height: 3,
                      backgroundColor: controller.carouselCurrentIndex.value == i
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
}
