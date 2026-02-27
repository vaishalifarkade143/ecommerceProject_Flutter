import 'package:ecommerseproject/common/widgets/products/cart/add_remove_button.dart';
import 'package:ecommerseproject/common/widgets/products/cart/cart_item.dart';
import 'package:ecommerseproject/common/widgets/texts/product_price_text.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartItems extends StatelessWidget {
  const TCartItems ({super.key, this.showAddRemoveButtons = true});

final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          itemCount: 2,
          itemBuilder: (_, index) => Column(
            children: [
              /// Cart Item
              TCartItem(),
              if(showAddRemoveButtons) SizedBox(height: TSizes.spaceBtwItems),
              /// Add Remove buttons with total price
              if(showAddRemoveButtons) 
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      /// Extra space
                      const SizedBox(
                        width: 70,
                      ),

                      ///Add Remove buttons
                      TProductQantityWithAddRemoveButton(),
                    ],
                  ),
                  TProductPriceText(price: '256')
                ],
              )
            ],
          ),
        );
  }
}