import 'package:ecommerseproject/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ecommerseproject/features/authentication/screens/onbording/widgets/onboarding_dot_navigation.dart';
import 'package:ecommerseproject/features/authentication/screens/onbording/widgets/onboarding_next_button.dart';
import 'package:ecommerseproject/features/authentication/screens/onbording/widgets/onboarding_page.dart';
import 'package:ecommerseproject/features/authentication/screens/onbording/widgets/onboarding_skip.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
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
        const OnBoardingNextButtion()
      ],
    ));
  }
}
