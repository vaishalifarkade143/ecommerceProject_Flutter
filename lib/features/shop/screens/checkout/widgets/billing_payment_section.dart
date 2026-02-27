import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'change',
          onPressed: () {},
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            TRoundedContainer(
              width: 50,
              height: 50,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: Image(image: AssetImage(TImages.payPal) , fit:BoxFit.contain,),
            ),
            SizedBox(width: TSizes.spaceBtwItems / 2,),
            Text('PayPal', style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
