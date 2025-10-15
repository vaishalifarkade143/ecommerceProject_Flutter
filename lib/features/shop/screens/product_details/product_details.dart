import 'package:ecommerseproject/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecommerseproject/features/shop/screens/product_details/widgets/product_metadata.dart';
import 'package:ecommerseproject/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';

import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TProductImageSlider(),

            //Product details
            Padding(
                padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                ),
                child: Column(
                  children: [
                    /// - Rating 
                    TRatingShareWidgets(),

                    /// - Price , Title  , Stack and Brand
                    TProductMetaData(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

