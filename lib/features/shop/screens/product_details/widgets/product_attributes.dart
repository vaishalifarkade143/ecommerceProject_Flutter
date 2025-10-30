import 'package:ecommerseproject/common/widgets/chips/choice_chips.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
import 'package:ecommerseproject/common/widgets/texts/product_price_text.dart';
import 'package:ecommerseproject/common/widgets/texts/product_title_text.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      // Selected Attribute Pricing and Desription
      children: [
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
                            "\$25",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),

                          /// Sale Price
                          TProductPriceText(price: '20')
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
                            "In Stock",
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
                    "This is the Description of the product and it can go upto max 4 lines.",
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
          children: [
            TSectionHeading(title: "Colors"),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              children: [
                TChoicesChips(
                  text: "Green",
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoicesChips(
                  text: "Blue",
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoicesChips(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
                
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: "Sizes"),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoicesChips(
                  text: "EU 34",
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoicesChips(
                  text: "EU 36",
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoicesChips(
                  text: "EU 38",
                  selected: false,
                  onSelected: (value) {},
                ),
                
              ],
            )
          ],
        )
      ],
    );
  }
}
