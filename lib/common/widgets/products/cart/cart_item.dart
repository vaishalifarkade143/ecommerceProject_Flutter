import 'package:ecommerseproject/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerseproject/common/widgets/texts/product_title_text.dart';
import 'package:ecommerseproject/common/widgets/texts/t_brand_title_text_with_verifired_icon.dart';
import 'package:ecommerseproject/features/shop/model/cart_item_model.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
            imageUrl: cartItem.image ?? '',
            width: 60,
            height: 60,
            isNetworkImage: true,
            padding: EdgeInsets.all(TSizes.sm),
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.darkerGrey
                : TColors.light),
        SizedBox(width: TSizes.spaceBtwItems),

        ///Title,Price, & size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleTextWithVerifiredIcon(title: cartItem.brandName ?? ''),
              Flexible(
                child: TProductTitleText(
                  title: cartItem.title,
                  maxLines: 1,
                ),
              ),

              /// Attributes
              Text.rich(
                TextSpan(
                  children:
                      // TextSpan( text: "Color", style: Theme.of(context).textTheme.bodySmall),
                      // TextSpan( text: "Green", style: Theme.of(context).textTheme.bodyLarge),
                      // TextSpan( text: "Size", style: Theme.of(context).textTheme.bodySmall),
                      // TextSpan( text: "UK 08", style: Theme.of(context).textTheme.bodySmall),
                      (cartItem.selectedVariation ?? {})
                          .entries
                          .map((e) => TextSpan(
                                children: [
                                  TextSpan(
                                      text: e.key,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  TextSpan(
                                      text: '${e.value}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ],
                              ))
                          .toList(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
