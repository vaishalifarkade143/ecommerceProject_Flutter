import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/products/rating/rating_indicator.dart';
import 'package:ecommerseproject/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:ecommerseproject/features/shop/screens/product_reviews/widgets/user_review_card.dart';

import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Reviews & Ratings',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
                'Rating and reviews are varified and are from people who use the same type of device that you use. '),
            SizedBox(height: TSizes.spaceBtwItems),

            ///overall product rating

            TOverallProductRating(),
            TRatingBarIndicator(rating: 4.5),
            Text(
              '12 13 15 16 ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            ///User reviews
            UserReviewCard(),
            UserReviewCard(),
            UserReviewCard(),
            UserReviewCard(),
          ]),
        ),
      ),
    );
  }
}
