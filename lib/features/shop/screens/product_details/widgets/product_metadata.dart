// import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
// import 'package:ecommerseproject/common/widgets/images/t_circular_image.dart';
// import 'package:ecommerseproject/common/widgets/texts/product_price_text.dart';
// import 'package:ecommerseproject/common/widgets/texts/product_title_text.dart';
// import 'package:ecommerseproject/common/widgets/texts/t_brand_title_text_with_verifired_icon.dart';
// import 'package:ecommerseproject/features/shop/controller/product/product_controller.dart';
// import 'package:ecommerseproject/features/shop/model/product_model.dart';
// import 'package:ecommerseproject/features/shop/model/product_type.dart';
// import 'package:ecommerseproject/utils/constants/colors.dart';
// import 'package:ecommerseproject/utils/constants/enum.dart';
// import 'package:ecommerseproject/utils/constants/image_strings.dart';
// import 'package:ecommerseproject/utils/constants/sizes.dart';
// import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';

// class TProductMetaData extends StatelessWidget {
//   const TProductMetaData({
//     super.key,
//     required this.product,
//   });

//   final ProductModel product;

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     final controller = ProductController.instance;
//     final salePercentage =
//         controller.calculateSalePercentage(product.price, product.salePrice);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // -- Price
//         Row(
//           children: [
//             if (salePercentage != null)
//             TRoundedContainer(
//               radious: TSizes.sm,
//               backgroundColor: TColors.secondary.withOpacity(0.8),
//               padding: const EdgeInsets.symmetric(
//                   horizontal: TSizes.sm, vertical: TSizes.xs),
//               child: Text(
//                 '$salePercentage%',
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelLarge!
//                     .apply(color: TColors.black),
//               ),
//             ),
//             const SizedBox(width: TSizes.spaceBtwItems),

//             /// Price
//             if (product.productType == ProductType.single.toString() &&
//                 product.salePrice > 0)
//               Text(
//                 '\$${product.price}',
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleSmall!
//                     .apply(decoration: TextDecoration.lineThrough),
//               ),
//             if (product.productType == ProductType.single.toString() &&
//                 product.salePrice > 0)
//               const SizedBox(width: TSizes.spaceBtwItems),
//             TProductPriceText(
//               price: controller.getProductPrice(product),
//               isLarge: true,
//             ),
//           ],
//         ),
//         const SizedBox(height: TSizes.spaceBtwItems / 1.5),
//         // -- Title
//         TProductTitleText(title:  product.title),
//         const SizedBox(height: TSizes.spaceBtwItems / 1.5),

//         // -- Stock status
//         Row(
//           children: [
//             TProductTitleText(title: 'Status '),
//             const SizedBox(height: TSizes.spaceBtwItems),
//             Text(controller.getProductStockStatus(product.stock),
//                 style: Theme.of(context).textTheme.titleMedium),
//           ],
//         ),

//         SizedBox(height: TSizes.spaceBtwItems / 1.5),
//         // -- Brand logo n name
//         Row(
//           children: [
//             TCircularImage(
//               image: product.brand != null ? product.brand!.image : '',
//               width: 32,
//               height: 32,
//               overlayColor: dark ? TColors.white : TColors.black,
//             ),
//             TBrandTitleTextWithVerifiredIcon(
//               title: product.brand != null ? product.brand!.name : '',
//               brandTextSize: TextSizes.medium,
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }



import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
import 'package:ecommerseproject/common/widgets/images/t_circular_image.dart';
import 'package:ecommerseproject/common/widgets/texts/product_price_text.dart';
import 'package:ecommerseproject/common/widgets/texts/product_title_text.dart';
import 'package:ecommerseproject/common/widgets/texts/t_brand_title_text_with_verifired_icon.dart';
import 'package:ecommerseproject/features/shop/controller/product/product_controller.dart';
import 'package:ecommerseproject/features/shop/controller/product/variation_controller.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/features/shop/model/product_type.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/enum.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // -- Price Row
        Row(
          children: [
            // Sale badge
            if (salePercentage != null)
              TRoundedContainer(
                radious: TSizes.sm,
                backgroundColor: TColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm, vertical: TSizes.xs),
                child: Text(
                  '$salePercentage%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black),
                ),
              ),
            if (salePercentage != null)
              const SizedBox(width: TSizes.spaceBtwItems),

            // Original price (strikethrough) for single products
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: TSizes.spaceBtwItems),

            // ✅ ADD HERE — Dynamic price (updates when variation selected)
            Obx(() {
              final variationController = VariationController.instance;
              final isVariable =
                  product.productType == ProductType.variable.toString();
              final price = isVariable &&
                      variationController
                          .selectedVariation.value!.id.isNotEmpty
                  ? variationController.getVariationPrice()
                  : controller.getProductPrice(product);
              return TProductPriceText(price: price, isLarge: true);
            }),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        // -- Title (fix: use product.title not hardcoded)
        TProductTitleText(title: product.title),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        // -- Stock status row
        Row(
          children: [
            TProductTitleText(title: 'Status '),
            const SizedBox(width: TSizes.spaceBtwItems),

            // ✅ ADD HERE — Dynamic stock (updates when variation selected)
            Obx(() {
              final variationController = VariationController.instance;
              final isVariable =
                  product.productType == ProductType.variable.toString();
              final status = isVariable &&
                      variationController
                          .selectedVariation.value!.id.isNotEmpty
                  ? variationController.variationStockStatus.value
                  : controller.getProductStockStatus(product.stock);
              return Text(status,
                  style: Theme.of(context).textTheme.titleMedium);
            }),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        // -- Brand
        Row(
          children: [
            TCircularImage(
              image: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            TBrandTitleTextWithVerifiredIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}