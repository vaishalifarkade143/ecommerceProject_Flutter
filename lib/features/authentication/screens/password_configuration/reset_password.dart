import 'package:ecommerseproject/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:ecommerseproject/features/authentication/screens/login/login.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

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
                      onPressed: () => Get.offAll(() => const LoginScreen()),
                      child: Text(TTexts.done)),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                SizedBox(
                  width: double.infinity,
                  // child: TextButton(
                  //       onPressed: () async {
                  //   try {
                  //     await FirebaseAuth.instance
                  //         .sendPasswordResetEmail(email: email);
                  //     TLoaders.successSnackBar(
                  //         title: 'Email Sent',
                  //         message: 'Password reset email resent to $email');
                  //   } catch (e) {
                  //     TLoaders.errorSnackBar(
                  //         title: 'Error', message: e.toString());
                  //   }
                  // },
                  //     child: Text(TTexts.resendEmail)),

                        child: TextButton(
                        onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                      child: Text(TTexts.resendEmail)),
                ),
              ],
            ),
          ),
        ));
  }
}
