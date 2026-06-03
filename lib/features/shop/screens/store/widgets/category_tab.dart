import 'package:ecommerseproject/common/widgets/brands/brand_show_case.dart';
import 'package:ecommerseproject/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerseproject/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:ecommerseproject/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/features/shop/controller/category_controller.dart';
import 'package:ecommerseproject/features/shop/model/category_model.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerseproject/features/shop/screens/store/widgets/category_brand.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

  
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),

              child: FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id, limit: 4),
                builder: (context, snapshot) {
                  final response = TCloudHelperFunction.checkMultipleRecordsState(snapshot: snapshot,loader: const TVerticalProductShimmer());
                
                if(response != null) {
                  return response;
                }
                //Record found
                final products = snapshot.data!;
                return Column(
                  children: [
                   
                    CategoryBrand(category: category),
                    const SizedBox(height: TSizes.spaceBtwItems),
                
                    // ✅ Real products
                    TSectionHeading(
                      title: 'You might like',
                      onPressed: () => Get.to(AllProductsScreen(
                        title: category.name,
                        futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                      )),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TGridLayout(
                      itemCount: products.length, // ✅ real count
                      itemBuilder: (_, index) => TProductCardVertical(
                        product: products[index], // ✅ real product
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                );
                }
              ),
            ),
          ],
        );
      
  }
}