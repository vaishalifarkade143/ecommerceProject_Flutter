//A utility class for manamging a full-screen loading dialog
import 'package:ecommerseproject/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  /// open  a full screen loading dialog with a given text and animation
  /// this methhod doesnt return anything.
  /// parameters:
  ///  - [text] the text to be displayed in the loading dialog
  /// - [animation] the animation to be displayed in the loading dialog, if null a default circular progress indicator will be used
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              // const SizedBox(
              //   height: 250,
              // ),
              TAnimationLoaderWidget(text  :text, animation: animation)
              
            ],
          ),
        ),
      ),
    );
  }

  /// stop the loading dialog
  /// this method will close the loading dialog if it is open, otherwise it will do nothing
  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // Close the  dialog using the Navigator
  }
}
