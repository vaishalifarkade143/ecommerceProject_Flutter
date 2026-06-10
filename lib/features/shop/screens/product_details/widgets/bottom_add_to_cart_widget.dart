import 'package:ecommerseproject/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommerseproject/features/shop/controller/product/cart_controller.dart';
import 'package:ecommerseproject/features/shop/controller/product/variation_controller.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddCard extends StatelessWidget {
  const TBottomAddCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    cartController.updateAlreadyAddedProductCount(product);
    final controller = VariationController.instance; // ADD THIS

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: TSizes.defaultSpace / 2,
        horizontal: TSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? TColors.dark : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiousLg),
          topRight: Radius.circular(TSizes.cardRadiousLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Row(
              children: [
                TCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: TColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: TColors.white,
                  onPressed: () {
                    if (controller.quantity.value > 0) {
                      controller.quantity.value -= 1;
                    }
                  },
                  // onPressed: () => cartController.productQuantityInCart.value < 1 ? null : cartController.productQuantityInCart.value -= 1, // ADD
                ),
                const SizedBox(width: TSizes.spaceBtwItems),

                // REPLACE hardcoded "2" with this
                Text(
                  controller.quantity.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                const SizedBox(width: TSizes.spaceBtwItems),
                TCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: TColors.black,
                  width: 40,
                  height: 40,
                  color: TColors.white,
                  onPressed: () => controller.quantity.value += 1,
                ),
              ],
            ),
          ),
          Obx(
            () => ElevatedButton(
              onPressed: controller.quantity.value < 1
                  ? null
                  : () => cartController.addToCart(product),
             
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(TSizes.md),
                
                backgroundColor: controller.quantity.value < 1 ? TColors.grey : TColors.black,
                side: const BorderSide(color: TColors.black),
              ),
              child:  Text('Add to Cart' ,  style: TextStyle(
    color: controller.quantity.value < 1 ? TColors.grey : TColors.white,
  ),),
            ),
          ),
        ],
      ),
    );
  }
}
