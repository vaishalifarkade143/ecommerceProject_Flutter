import 'package:ecommerseproject/common/styles/shadows.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
import 'package:ecommerseproject/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommerseproject/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerseproject/common/widgets/texts/product_price_text.dart';
import 'package:ecommerseproject/common/widgets/texts/product_title_text.dart';
import 'package:ecommerseproject/common/widgets/texts/t_brand_title_text_with_verifired_icon.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadious),
        color: dark ? TColors.darkerGrey : TColors.grey,
      ),
      child: Row(
        children: [
          /// - 1 Thumbnail Image
          TRoundedContainer(
            height: 120,
            width: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(children: [
              SizedBox(
                child: TRoundedImage(
                    imageUrl: TImages.productImage1, applyImageRadious: true),
              ),

              //Sales
              Positioned(
                top: 12,
                child: TRoundedContainer(
                  radious: TSizes.sm,
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.sm, vertical: TSizes.xs),
                  backgroundColor: TColors.secondary.withOpacity(0.8),
                  child: Text(
                    "25%",
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: TColors.black,
                        ),
                  ),
                ),
              ),

// Favorites
              Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red))
            ]),
          ),

          /// - 2 Product Details
          SizedBox(
            width: 172,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: TSizes.sm,
                    left: TSizes.sm,
                  ),
                  child:
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: "Green nike half sleves t-shirt for men",
                        smallSize: true,
                      ),
                      SizedBox(height: TSizes.spaceBtwSections / 2),
                      TBrandTitleTextWithVerifiredIcon(title: 'Nike'),
                    ],
                   ),
                  ),
              

                ///Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Padding(
                      // padding: EdgeInsets.only(left: TSizes.sm),
                      // child: 
                      Flexible(child: TProductPriceText(price: '256.0 - 25683.5')),
                    // ),
                    Container(
                      decoration: BoxDecoration(
                        color: TColors.dark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(TSizes.cardRadiousMd),
                          bottomLeft:
                              Radius.circular(TSizes.productImageRadious),
                        ),
                      ),
                      child: SizedBox(
                        height: TSizes.iconLg * 1.2,
                        width: TSizes.iconLg * 1.2,
                        child: Center(
                            child: Icon(
                          Iconsax.add,
                          color: TColors.white,
                        )),
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
