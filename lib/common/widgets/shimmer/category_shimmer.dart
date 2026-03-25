import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/common/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key ,  this.itemCount = 6});
  final int itemCount ;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>  SizedBox(width: TSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TShimmerEffect(width: 55, height: 8, ),
            ],
          );
        },
      ),
    );
  }
}