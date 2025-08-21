import 'package:ecommerseproject/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
             SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
             SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// Text Field
            TextFormField(decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),),
            const SizedBox(height: TSizes.spaceBtwSections,),

            /// submit Button 
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.off(()=> const ResetPassword()), child: const Text(TTexts.submit)),)

          ],
        ),
      ),
    );
  }
}
