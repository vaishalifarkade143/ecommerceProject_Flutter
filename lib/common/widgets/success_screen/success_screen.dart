import 'package:ecommerseproject/common/styles/spacing_styles.dart';
import 'package:ecommerseproject/features/authentication/screens/login/login.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      this.onPressed});

  final String image, title, subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: TspacingStyle.paddingWithAppBarHeight * 2,
      child: Column(
        children: [
          
          Lottie.asset(
            image,
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// Title and SubTitle
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            subtitle,
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
                onPressed: () => Get.offAll(() => LoginScreen()),
                child: Text(TTexts.tcontinue)),
          ),
        ],
      ),
    )));
  }
}
