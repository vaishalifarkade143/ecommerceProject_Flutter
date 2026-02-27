import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'change', onPressed: null),
        Text('123 Main Street, City, Country', style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          children: [
              Icon(Icons.phone, size: 16,color: Colors.grey,),
              SizedBox(width: TSizes.spaceBtwItems,),
              Text('+1 234 567 890', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2,),
          Row(
          children: [
              Icon(Icons.location_history, size: 16,color: Colors.grey,),
              SizedBox(width: TSizes.spaceBtwItems,),
              Expanded(child: Text('123 Main Street, City, Country ', style: Theme.of(context).textTheme.bodyMedium,softWrap: true,)),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems/2,),
      ],
    );
  }
}