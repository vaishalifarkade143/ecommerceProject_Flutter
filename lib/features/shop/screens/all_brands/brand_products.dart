import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/brands/t_brand_card.dart';
import 'package:ecommerseproject/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace) ,
        child:  Column(
          children: [
            ///Brand Details
            const TBrandCard(showBorder: true),
            const SizedBox(height: TSizes.spaceBtwSections),
            TSortebaleProducts(),
          ],
        ),
        
        ),
        
      ),
    );
  }
}