import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, index) => SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (_, index) => TRoundedContainer(
        showBorder: true,
        padding: EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Row 1
            Row(
              children: [
                /// - 1 Icon
                Icon(Iconsax.ship),
                SizedBox(width: TSizes.spaceBtwItems / 2),

                /// - 2 status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Processing",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        "12/12/2023",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),

                /// 3 Icon
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Iconsax.arrow_right_34,
                      size: TSizes.iconSm,
                    ))
              ],
            ),

            SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// - 1 Icon
                      Icon(Iconsax.tag),
                      SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// - 2 status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              "[#j525]",
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      ),

                      /// 3 Icon
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Iconsax.arrow_right_34,
                            size: TSizes.iconSm,
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      /// - 1 Icon
                      Icon(Iconsax.calendar),
                      SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// - 2 status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shipping Date",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              " 02 DEC 2026",
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      ),

                      /// 3 Icon
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Iconsax.arrow_right_34,
                            size: TSizes.iconSm,
                          ))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
