import 'package:ecommerseproject/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/search_container.dart';
import 'package:ecommerseproject/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerseproject/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          PrimaryHeaderContainer(
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
                      THomeCategories()
                    ],
                  ),
                )
              ],
            ),
          ),

          /// Body --
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: TRoundedImage(
              imageUrl: TImages.promoBanner1,
            ),
          )
        ],
      ),
    ));
  }
}

