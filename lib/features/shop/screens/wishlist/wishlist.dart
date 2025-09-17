import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommerseproject/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerseproject/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:ecommerseproject/features/shop/screens/home/home.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget{
  const FavouriteScreen({
    super.key
  });

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
      appBar: TAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineLarge,),
        actions: [TCircularIcon(icon: Iconsax.add , onPressed: () => Get.to(const HomeScreen()),)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: products.length, itemBuilder: (_, index) => TProductCardVertical(product: products[index]))
            ],
          ),
          ),
      ),
    );
  }

}