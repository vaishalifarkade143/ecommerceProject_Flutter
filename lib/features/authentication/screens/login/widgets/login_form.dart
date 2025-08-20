import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            ///Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
    
            //Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
    
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Rembember  me
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe)
                  ],
                ),
                const SizedBox(width: TSizes.spaceBtwSections),
    
                /// Forgot Password
                TextButton(
                    onPressed: () {},
                    child: const Text(TTexts.forgotPassword)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections/2),
    
            /// Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: Text(TTexts.signIn))),
            const SizedBox(height: TSizes.spaceBtwItems),
    
            /// create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {},
                    child: Text(TTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}