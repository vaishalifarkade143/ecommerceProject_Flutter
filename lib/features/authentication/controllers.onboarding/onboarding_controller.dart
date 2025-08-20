import 'package:ecommerseproject/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll
  // ignore: strict_top_level_inference
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Logic for navigating to a specific page in the onboarding process
  // ignore: strict_top_level_inference
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & jump to nextpage
  void nextPage() {
    if(currentPageIndex.value == 2){
      Get.offAll(const LoginScreen());
    }
    else{
      int page  =  currentPageIndex.value + 1 ;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index And Jump to last Page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
