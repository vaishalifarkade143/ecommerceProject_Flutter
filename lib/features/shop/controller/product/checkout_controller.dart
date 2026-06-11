import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/features/shop/model/payment_method_controller.dart';
import 'package:ecommerseproject/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(image: TImages.payPal, name: 'Paypal');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(TSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionHeading(
                      title: 'Select Payment Method',
                      showActionButton: false,
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    TPaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: TImages.payPal, name: 'Paypal'),
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.googlePay, name: 'Google Pay')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.applePay, name: 'Apple Pay')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.visa, name: 'VISA')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.masterCard, name: 'Master Card')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.paytm, name: 'Paytm')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.payStack, name: 'PayStack')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.creditCard, name: 'Credit Card')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    )
                  ],
                ),
              ),
            ));
  }
}
