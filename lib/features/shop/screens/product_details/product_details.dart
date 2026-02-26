import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ecommerseproject/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerseproject/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecommerseproject/features/shop/screens/product_details/widgets/product_metadata.dart';
import 'package:ecommerseproject/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecommerseproject/features/shop/screens/product_reviews/product_review.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddCard(),
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

                    // --Attributes
                    TProductAttributes(),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    //-- Checkout Options
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Checkout")),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    //-- Description
                    const TSectionHeading(
                      title: 'Description',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    const ReadMoreText(
                      'This is a detailed description of the product. It provides all the necessary information that a customer might need to make an informed purchasing decision. The description can include features, specifications, usage instructions, and any other relevant details that highlight the value of the product. A well-written product description can significantly enhance the shopping experience and increase the likelihood of a sale.',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Less',
                      moreStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    //-- Reviews
                    const Divider(),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TSectionHeading(title: 'Reviews(199)',showActionButton: false, ),
                        IconButton(onPressed: () => Get.to(() => const ProductReviewScreen()), icon: const Icon(Iconsax.arrow_right_3)),
                      ],
                    ),
                   
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
