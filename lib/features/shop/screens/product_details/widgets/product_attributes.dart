import 'package:ecommerseproject/common/widgets/chips/choice_chips.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
import 'package:ecommerseproject/common/widgets/texts/product_price_text.dart';
import 'package:ecommerseproject/common/widgets/texts/product_title_text.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/features/shop/controller/product/variation_controller.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      ()=> Column(
        // Selected Attribute Pricing and Desription
        children: [
          if (controller.selectedVariation.value!.id.isNotEmpty)
            TRoundedContainer(
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.dark : TColors.grey,
              child: Column(
                children: [
                  //price Title and Status
                  Row(
                    children: [
                      const TSectionHeading(
                        title: "Variation",
                        showActionButton: false,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TProductTitleText(
                                title: "Price : ",
                                smallSize: true,
                              ),
      
                              /// Actual Price
                              Text(
                                "\$${controller.getVariationPrice()}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                              SizedBox(
                                width: TSizes.spaceBtwItems,
                              ),
      
                              /// Sale Price
                              TProductPriceText(price: controller.getVariationPrice())
                            ],
                          ),
      
                          //Stack
                          Row(
                            children: [
                              TProductTitleText(
                                title: "Stock : ",
                                smallSize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  TProductTitleText(
                    title:
                        controller.selectedVariation.value!.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
      
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          //Attribute Options
      
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                            title: attribute.name ?? '', showActionButton: false),
                        SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        Obx(() =>
                          Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected =
                                  controller.selectedAttributes[attribute.name] ==
                                      attributeValue;
                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!, attribute.name!)
                                  .contains(attributeValue);
                              return TChoicesChips(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(product,
                                              attribute.name ?? '', attributeValue);
                                        }
                                      }
                                    : null,
                              );
                            }).toList(),
                          ),
                          
                        ),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
