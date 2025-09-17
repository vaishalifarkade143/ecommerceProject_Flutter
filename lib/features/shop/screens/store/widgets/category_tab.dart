import 'package:ecommerseproject/common/widgets/brands/brand_show_case.dart';
import 'package:ecommerseproject/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerseproject/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
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

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///== Brand
            TBrandShowCase(
              images: [
                TImages.productImage10,
                TImages.productImage2,
                TImages.productImage1
              ],
            ),
      
            ///-- Product
            TSectionHeading(
              title: 'You might like',
              onPressed: () {},
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TGridLayout(
                itemCount: products.length,
                itemBuilder: (_, index) => TProductCardVertical(
                      product: products[index],
                    )),
                    const SizedBox(height: TSizes.spaceBtwSections,)
          ],
        ),
      ),
      ]
    );
  }
}
