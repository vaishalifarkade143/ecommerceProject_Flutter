import 'package:ecommerseproject/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddCard extends StatelessWidget {
  const TBottomAddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
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
          Row(
            children: [
              TCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: TColors.darkGrey,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                "2",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              TCircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(
                TSizes.md,
              ),
              backgroundColor: TColors.black,
              side: const BorderSide(
                color: TColors.black,
              ),
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
