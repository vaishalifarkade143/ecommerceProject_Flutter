import 'package:ecommerseproject/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';



class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: TSizes.defaultSpace,
        top: TDeviceUtils.getAppBarHeight(),
        child: TextButton(onPressed: () => OnBoardingController.instance.skipPage(), child: const Text('Skip')));
  }
}