import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TRatingShareWidgets extends StatelessWidget {
  const TRatingShareWidgets({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
    
      Row(
        children: [
          Icon(Iconsax.star_1,
              color: dark ? Colors.amber : Colors.amber,
              size: 24,),
              SizedBox(width: TSizes.spaceBtwItems / 2),
              Text.rich(TextSpan(
                children: [
                  TextSpan(text:'5.0', 
                  style:Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text:'(199)')
              ]))
        ],
      ),
      //share button
      IconButton(onPressed: (){}, icon: Icon(Icons.share, size: TSizes.iconMd))
    ],);
  }
}
