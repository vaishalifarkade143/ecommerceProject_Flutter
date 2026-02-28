import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerseproject/common/widgets/products/product_cards/product_cart_horizontal.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Sub Categories'),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Banner
            const TRoundedImage(imageUrl: TImages.promoBanner1, width: double.infinity, height: null ,applyImageRadious: true,),
            const SizedBox(height: TSizes.spaceBtwSections,),
            /// Sub Categories
            Column(
              children: [
                ///Heading
                TSectionHeading(title: 'Sports Shoes ' , onPressed: (){},),
                  const SizedBox(height: TSizes.spaceBtwSections/2),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                      itemCount: 4,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const TProductCardHorizontal()
                      ),
                    ),
              ],
            )
          ],
        ),
        ),
        
      ),
    );
  }
}