import 'package:ecommerseproject/common/widgets/shimmer/shimmer.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: TShimmerEffect(
              width: 150,
              height: 110,
            )),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
                child: TShimmerEffect(
              width: 150,
              height: 110,
            )),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
                child: TShimmerEffect(
              width: 150,
              height: 110,
            )),
          ],
        ),
      ],
    );
  }
}
