import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerseproject/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

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
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              DropdownButtonFormField(
                decoration:
                    const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (value) {},
                items: [
                  'Name',
                  'Price',
                  'Rating',
                  'Lower Price',
                  'Higher Price',
                  'Newest',
                  'Popularity'
                ]
                    .map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option)))
                    .toList(),
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              /// Products Grid
            TGridLayout(itemCount: 4, itemBuilder: (_ , index) => TProductCardVertical(product: products[index],))
            ],
          ),
        ),
      ),
    );
  }
}
