
import 'package:ecommerseproject/data/repositories/banners/bannar_repository.dart';
import 'package:ecommerseproject/features/shop/model/banner_model.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  // static BannarController get instance => Get.find();
  /// variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  //update page navigational dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

@override
  void onInit() {
    fetchBanners();
    super.onInit();
  }
  ///Fetch Banner
 Future<void> fetchBanners() async {
    try {
      // show lader while loading categories
      isLoading.value = true;
      //Fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //assign banners
      this.banners.assignAll(banners);
    
    } catch (e) {
      // print('Error fetching categories: $e');
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }
}


// import 'package:ecommerseproject/features/shop/model/banner_model.dart';
// import 'package:ecommerseproject/utils/constants/image_strings.dart';
// import 'package:ecommerseproject/routes/routes.dart';
// import 'package:get/get.dart';

// class BannerController extends GetxController {
//   final carouselCurrentIndex = 0.obs;
//   final isLoading = false.obs;
//   final RxList<BannerModel> banners = <BannerModel>[].obs;

//   void updatePageIndicator(index) {
//     carouselCurrentIndex.value = index;
//   }

//   @override
//   void onInit() {
//     loadLocalBanners(); // ← uses local assets, no Firebase needed
//     super.onInit();
//   }

//   void loadLocalBanners() {
//     isLoading.value = true;
//     banners.assignAll([
//       BannerModel(
//         imageUrl: TImages.promoBanner1,
//         targetScreen: TRoutes.home,
//         active: true,
//         isLocalAsset: true,
//       ),
//       BannerModel(
//         imageUrl: TImages.promoBanner2,
//         targetScreen: TRoutes.store,
//         active: true,
//         isLocalAsset: true,
//       ),
//       BannerModel(
//         imageUrl: TImages.promoBanner3,
//         targetScreen: TRoutes.home,
//         active: true,
//         isLocalAsset: true,
//       ),
//     ]);
//     isLoading.value = false;
//   }
// }
