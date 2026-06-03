import 'package:ecommerseproject/common/widgets/shimmer/shimmer.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TListTileShimmer extends StatelessWidget {
  const TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children : [
        TShimmerEffect(width: 50, height: 10, radius: 50),
        SizedBox(width : TSizes.spaceBtwItems),
        Column(
          children:[
            TShimmerEffect(width: double.infinity, height: 10, radius: 50),
            SizedBox(width : TSizes.spaceBtwItems /2),
            TShimmerEffect(width: double.infinity, height: 10, radius: 50)
          ]
        )
      ]
    );
  }
}