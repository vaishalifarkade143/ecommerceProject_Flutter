import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerseproject/common/widgets/shimmer/brand_shimmer.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/features/shop/controller/brand_controller.dart';
import 'package:ecommerseproject/features/shop/model/brand_model.dart';
import 'package:ecommerseproject/features/shop/screens/all_brands/brand_products.dart';
import 'package:ecommerseproject/features/shop/screens/store/widgets/brand_card.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text('Brands'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Heading
              TSectionHeading(
                title: 'Brands',
                showActionButton: true,
              ),
              SizedBox(height: TSizes.spaceBtwItems),

              Obx(() {
                if (brandController.isLoading.value) {
                  return const TBrandShimmer(
                      ); // or CircularProgressIndicator()
                }
                if(brandController.allBrands.isEmpty){
                  return Center(child: Text('No brands found'));
                }
                return TGridLayout(
                  itemCount: brandController.allBrands.length,
                  mainAxisExtent: 70,
                  itemBuilder: (_, index) {
                    final brand = brandController.allBrands[index];
                    return TBrandCard(
                      brand: brand,
                      showBorder: true,
                      onTap: () => Get.to(() => BrandProducts()),
                    );
                  },
                );
              }),

              /// Brands Grid
            ],
          ),
        ),
      ),
    );
  }
}
