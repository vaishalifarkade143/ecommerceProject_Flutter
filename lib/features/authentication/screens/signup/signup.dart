import 'package:ecommerseproject/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerseproject/common/widgets/login_signup/social_button.dart';
import 'package:ecommerseproject/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      // appBar: AppBar(),
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // or Theme.of(context).scaffoldBackgroundColor
        elevation: 0,
        iconTheme: IconThemeData(
          color: dark
              ? TColors.white // White arrow in dark mode
              : TColors.black, // Black arrow in light mode
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              //Form
              SignUpForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Divider
              FormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Social Buttons
              const SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
