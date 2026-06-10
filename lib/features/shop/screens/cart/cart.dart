import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerseproject/features/shop/controller/product/cart_controller.dart';
import 'package:ecommerseproject/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerseproject/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerseproject/navigation_menu.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Obx(() {
        //Nothing Found widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops Cart is empty',
          showAction: true,
          animation: TImages.cartAnimation,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: TCartItems(),
            ),
          );
        }
      }),

      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: Obx(()=> Text('Checkout \$${controller.totalCartPrice.value} ')),
        ),
      ),
    );
  }
}
