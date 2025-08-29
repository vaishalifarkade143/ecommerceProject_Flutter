import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();
  final carouselCurrentIndex= 0.obs;
  // ignore: strict_top_level_inference
  void updatePageIndicator(index){
    carouselCurrentIndex.value=index;
  }

}