import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///Image
          Image(
            image: AssetImage(TImages.deliveredEmailIllustration),
            width: THelperFunctions.screenWidth() * 0.6,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// Title and SubTitle
          Text(
            TTexts.changeYourPasswordTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            TTexts.changeYourPasswordSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          ///Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                child: Text(TTexts.done)),
          ),
             const SizedBox(
            height: TSizes.spaceBtwItems,
          ),   

               SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () {},
                child: Text(TTexts.resendEmail)),
          ),
              ],
            ),
          ),
        ));
  }
}
