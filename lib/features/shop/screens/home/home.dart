import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/search_container.dart';
import 'package:ecommerseproject/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerseproject/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:ecommerseproject/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/features/shop/controller/product/product_controller.dart';
import 'package:ecommerseproject/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerseproject/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerseproject/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerseproject/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProductController());

    final controller = Get.find<ProductController>();
// ✅ After — finds the already-registered instance from bindings
// final controller = ProductController.instance;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          /// Header + Categories
          PrimaryHeaderContainer(
            height: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// AppBar
                const THomeAppBar(),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Search Bar
                TSearchContainer(
                  text: 'Search in Store',
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Categories
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      /// --  Heading
                      TSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColors: Colors.white,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      /// -- Categories List
                      THomeCategories(
                          // categories: categories,
                          )
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: TSizes.spaceBtwSections,
                // ),
              ],
            ),
          ),

          /// Body --
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                TPromoSlider(
                    // banners: [
                    //   TImages.promoBanner1,
                    //   TImages.promoBanner2,
                    //   TImages.promoBanner3
                    // ],
                    ),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// - Heading
                TSectionHeading(
                  title: 'Popular Products',
                  onPressed: () => Get.to(() => AllProductsScreen(
                      title: 'Popular Products',
                      // query: FirebaseFirestore.instance
                      //     .collection('Products')
                      //     .where('IsFeatured', isEqualTo: true)
                      //     .limit(6),
                          futureMethod: controller.fetchAllFeaturedProducts(),
                          ),
                      
                          ),
                  showActionButton: true,
                  // textColors: Colors.black
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                // -- Popular Products
                Obx(() {
                  if (controller.isLoading.value) {
                    return const TVerticalProductShimmer();
                  }
                  if (controller.featuredProducts.isEmpty) {
                    return const Center(
                        child: Text('No featured products available.'));
                  }

                  return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => TProductCardVertical(
                            product: controller.featuredProducts[index],
                          ));
                })
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
