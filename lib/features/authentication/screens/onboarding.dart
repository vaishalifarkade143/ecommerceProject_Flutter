import 'package:ecommerseproject/features/authentication/screens/widgets/onboarding_dot_navigation.dart';
import 'package:ecommerseproject/features/authentication/screens/widgets/onboarding_page.dart';
import 'package:ecommerseproject/features/authentication/screens/widgets/onboarding_skip.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:ecommerseproject/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          children: const [
            //PAGE
            OnBoardingPage(
              image: TImages.onBoardingImage2,
              title: TTexts.onBoardingTitle1,
              subtitle: TTexts.onBoardingSubtitle1,
            ),
            OnBoardingPage(
              image: TImages.onBoardingImage3,
              title: TTexts.onBoardingTitle2,
              subtitle: TTexts.onBoardingSubtitle2,
            ),
            OnBoardingPage(
              image: TImages.onBoardingImage1,
              title: TTexts.onBoardingTitle3,
              subtitle: TTexts.onBoardingSubtitle3,
            ),
          ],
        ),

        //skip buttom
        const OnBoardingSkip(),

        ///Dot Navigation SmoothPageIndicator
        const OnBoardingDotNavigation(),

        ///Circular button
        Positioned(
          right: TSizes.defaultSpace,
          bottom: TDeviceUtils.getBottomNavigationBarHeight(),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), backgroundColor: Colors.black),
              child: const Icon(Iconsax.arrow_right_3)),
        )
      ],
    ));
  }
}
