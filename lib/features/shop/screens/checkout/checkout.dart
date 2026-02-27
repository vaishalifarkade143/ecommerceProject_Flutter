import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
import 'package:ecommerseproject/common/widgets/products/cart/coupon_widget.dart';
import 'package:ecommerseproject/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerseproject/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerseproject/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerseproject/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerseproject/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerseproject/navigation_menu.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ///-- ITems in Cart
              const TCartItems(showAddRemoveButtons: false),
              SizedBox(height: TSizes.spaceBtwSections),
          
              /// -- Coupon TextField
              TcuponCode(),
              SizedBox(height: TSizes.spaceBtwSections),
          
              //-- Billing section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
          
                    /// Divideer
                    const Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    /// Payment Method
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    /// Address
                    TBillingAddressSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    
        // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(()=> SuccessScreen(
            image: TImages.successfulPaymentIcon,
            title: 'Payment Successful',
            subtitle: 'Your order has been placed successfully.',
            onPressed: ()=> Get.offAll(() => const NavigationMenu()),
          ),
          ),
          child: Text('Checkout \$256.0 '),
           
        ),
      ),
    );
  }
}

