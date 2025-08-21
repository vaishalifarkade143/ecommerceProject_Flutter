import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 10,
            height: 5,
            child:
                Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${TTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '${TTexts.privacyPolicy} ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                        color: dark
                            ? TColors.white
                            : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark
                            ? TColors.white
                            : TColors.primary,
                      )),
              TextSpan(
                  text: '${TTexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: TTexts.termsOfUse,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                        color: dark
                            ? TColors.white
                            : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark
                            ? TColors.white
                            : TColors.primary,
                      )),
            ],
          ),
        )
      ],
    );
  }
}
