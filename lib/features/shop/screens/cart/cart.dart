import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/products/cart/add_remove_button.dart';
import 'package:ecommerseproject/common/widgets/products/cart/cart_item.dart';
import 'package:ecommerseproject/common/widgets/texts/product_price_text.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          itemCount: 10,
          itemBuilder: (_, index) => Column(
            children: [
              TCartItem(),
              SizedBox(height: TSizes.spaceBtwItems),
              Row(
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Checkout \$256.0 '),
           
        ),
      ),
    );
  }
}
