import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
import 'package:ecommerseproject/features/shop/controller/product/checkout_controller.dart';
import 'package:ecommerseproject/features/shop/model/payment_method_controller.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TPaymentTile extends StatelessWidget {
  const TPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
        contentPadding: const EdgeInsets.all(0),
        onTap: () {
          controller.selectedPaymentMethod.value = paymentMethod;
          Get.back();
        },
        leading: TRoundedContainer(
          width: 60,
          height: 40,
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.white,
          padding: EdgeInsets.all(TSizes.sm),
          child: Image(image : AssetImage(paymentMethod.image) , fit : BoxFit.contain),
        ),
        title:  Text(paymentMethod.name),
        trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}