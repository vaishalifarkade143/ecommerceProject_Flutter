import 'package:ecommerseproject/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/search_container.dart';
import 'package:ecommerseproject/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/devices/device_utility.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
            ],
          ))
        ],
      ),
    ));
  }
}
