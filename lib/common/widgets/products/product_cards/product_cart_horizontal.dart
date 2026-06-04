import 'package:ecommerseproject/common/styles/shadows.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
import 'package:ecommerseproject/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommerseproject/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerseproject/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:ecommerseproject/common/widgets/texts/product_price_text.dart';
import 'package:ecommerseproject/common/widgets/texts/product_title_text.dart';
import 'package:ecommerseproject/common/widgets/texts/t_brand_title_text_with_verifired_icon.dart';
import 'package:ecommerseproject/features/shop/controller/product/product_controller.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/features/shop/model/product_type.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

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
                    imageUrl: product.thumbnail,
                    applyImageRadious: true,
                    isNetworkImage: true),
              ),

              //Sales
              if (salePercentage != null)
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radious: TSizes.sm,
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    child: Text(
                      "${salePercentage}",
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
                child: TFavouriteIcon(productId: product.id),
              )
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: product.title,
                        smallSize: true,
                      ),
                      SizedBox(height: TSizes.spaceBtwSections / 2),
                      TBrandTitleTextWithVerifiredIcon(
                          title: product.brand!.name),
                    ],
                  ),
                ),

                const Spacer(),

                ///Price Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (product.productType ==
                                  ProductType.single.toString() &&
                              product.salePrice > 0)
                            Padding(
                                padding: const EdgeInsets.only(left: TSizes.sm),
                                child: TProductPriceText(
                                  price: product.price.toString(),
                                )),
                          Padding(
                            padding: const EdgeInsets.only(left: TSizes.sm),
                            child: TProductPriceText(
                              price: controller.getProductPrice(product),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //add to cart button
                    Container(
                      decoration: BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiousMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadious),
                          )),
                      child: const SizedBox(
                        width: TSizes.iconLg * 1.2,
                        height: TSizes.iconLg * 1.2,
                        child: Center(
                          child: Icon(Iconsax.add, color: TColors.white),
                        ),
                      ),
                    )
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
