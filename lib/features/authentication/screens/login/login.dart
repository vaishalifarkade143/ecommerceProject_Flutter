import 'package:ecommerseproject/common/styles/spacing_styles.dart';
import 'package:ecommerseproject/common/widgets.login_signup/form_divider.dart';
import 'package:ecommerseproject/common/widgets.login_signup/social_button.dart';
import 'package:ecommerseproject/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerseproject/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: TspacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            //logo , title n subtitle
            LoginHeader(dark: dark),

            ///Form
            LoginForm(),

            //Divider
            FormDivider(dividerText: TTexts.orSignInWith.capitalize!,),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Footer
            SocialButton()
          ],
        ),
      ),
    ));
  }
}
