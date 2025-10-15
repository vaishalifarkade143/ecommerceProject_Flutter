import 'package:ecommerseproject/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/search_container.dart';
import 'package:ecommerseproject/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerseproject/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerseproject/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerseproject/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Categories
    final categories = [
      CategoryModel(name: "Sports", icon: TImages.sportIcon),
      CategoryModel(name: "Clothes", icon: TImages.clothIcon),
      CategoryModel(name: "Shoes", icon: TImages.shoeIcon),
      CategoryModel(name: "Cosmetics", icon: TImages.cosmeticsIcon),
      CategoryModel(name: "Electronics", icon: TImages.electronicsIcon),
    ];

    /// Products
    final products = [
      ProductModel(
          title: "Casual Shirt",
          image: TImages.productImage1,
          price: 35,
          brand: "Shein"),
      ProductModel(
          title: "Red Dress",
          image: TImages.productImage2,
          price: 55,
          brand: "H&M"),
      ProductModel(
          title: "Jewelry Set",
          image: TImages.productImage11,
          price: 120,
          brand: "Zara"),
      ProductModel(
          title: "Cosmetic Kit",
          image: TImages.productImage21,
          price: 80,
          brand: "Sephora"),
    ];

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
                        categories: categories,
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
                  banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// - Heading
                TSectionHeading(
                  title: 'Popular Products',
                  onPressed: () {},
                  showActionButton: true,
                  // textColors: Colors.black
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                // -- Popular Products
                TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) => TProductCardVertical(
                          product: products[index],
                        ))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
