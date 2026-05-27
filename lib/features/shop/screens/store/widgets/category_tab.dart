import 'package:ecommerseproject/common/widgets/brands/brand_show_case.dart';
import 'package:ecommerseproject/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerseproject/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/features/shop/controller/category_controller.dart';
import 'package:ecommerseproject/features/shop/model/category_model.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

// class TCategoryTab extends StatelessWidget {
//   const TCategoryTab({super.key, required this.category});
//   final CategoryModel category; 

//   @override
//   Widget build(BuildContext context) {
    
//     return ListView(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(TSizes.defaultSpace),
//             child: Column(
//               children: [
//                 ///== Brand
//                 TBrandShowCase(
//                   images: [
//                     TImages.productImage10,
//                     TImages.productImage2,
//                     TImages.productImage1
//                   ],
//                 ),
//                 TBrandShowCase(
//                   images: [
//                     TImages.productImage10,
//                     TImages.productImage2,
//                     TImages.productImage1
//                   ],
//                 ),
//                 const SizedBox(
//                   height: TSizes.spaceBtwItems,
//                 ),

//                 ///-- Product
//                 TSectionHeading(
//                   title: 'You might like',
//                   onPressed: () {},
//                 ),
//                 const SizedBox(
//                   height: TSizes.spaceBtwItems,
//                 ),
//                 TGridLayout(
//                     itemCount: 4,
//                     itemBuilder: (_, index) => TProductCardVertical(
//                           product:ProductModel.empty(),
//                         )),
//                 const SizedBox(
//                   height: TSizes.spaceBtwSections,
//                 )
//               ],
//             ),
//           ),
//         ]);
//   }
// }


class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;

    return FutureBuilder<List<ProductModel>>(
      future: categoryController.getCategoryProducts(category.id),
      builder: (context, snapshot) {
        // Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        // Error state
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        // Empty state
        final products = snapshot.data ?? [];
        if (products.isEmpty) {
          return const Center(child: Text('No products found'));
        }

        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Brand showcase (keep as is)
                  TBrandShowCase(images: [
                    TImages.productImage10,
                    TImages.productImage2,
                    TImages.productImage1
                  ]),
                  TBrandShowCase(images: [
                    TImages.productImage10,
                    TImages.productImage2,
                    TImages.productImage1
                  ]),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // ✅ Real products
                  TSectionHeading(title: 'You might like', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TGridLayout(
                    itemCount: products.length, // ✅ real count
                    itemBuilder: (_, index) => TProductCardVertical(
                      product: products[index], // ✅ real product
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}