import 'package:ecommerseproject/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerseproject/features/authentication/screens/login/login.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => LoginScreen()),
              icon: Icon(CupertinoIcons.clear))
        ],
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
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                'vaishali.f@veerit.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(
                          () => SuccessScreen(
                            image: TImages.staticSuccessIllustration,
                            title: TTexts.yourAccountCreatedTilte,
                            subtitle: TTexts.yourAccountCreatedSubTilte,
                            onPressed: () => Get.to(() => const LoginScreen()),
                          ),
                        ),

                  //    onPressed: () {
                  //   // Debug: make sure constants are not null
                  //   // ignore: avoid_print
                  //   print("Image: ${TImages.staticSuccessIllustration}");
                  //   // ignore: avoid_print
                  //   print("Title: ${TTexts.yourAccountCreatedTilte}");
                  //   // ignore: avoid_print
                  //   print("Subtitle: ${TTexts.yourAccountCreatedSubTilte}");

                  //   Get.to(
                  //     () => SuccessScreen(
                  //       image: TImages.staticSuccessIllustration,
                  //       title: TTexts.yourAccountCreatedTilte,
                  //       subtitle: TTexts.yourAccountCreatedSubTilte,
                  //       onPressed: () =>
                  //           Get.to(() => const LoginScreen()),
                  //     ),
                  //   );
                  // },
                    child: Text(TTexts.tcontinue)),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: Text(TTexts.resendEmail)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
