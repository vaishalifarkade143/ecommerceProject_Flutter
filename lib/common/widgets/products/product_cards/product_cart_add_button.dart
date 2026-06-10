import 'package:ecommerseproject/features/shop/controller/product/cart_controller.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/features/shop/model/product_type.dart';
import 'package:ecommerseproject/features/shop/screens/product_details/product_details.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCartAddToCartButton extends StatelessWidget {
  const ProductCartAddToCartButton({
    super.key, required this.product,
  });
   final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: (){
        if(product.productType == ProductType.single.toString()){
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        }
        else{
          Get.to(() => ProductDetailsScreen(product: product));
        }
      },
      child: Obx(() { 
        final productQuantityInCart = cartController.getProductQuantityInCart(product.id);

        return Container(
          decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? TColors.primary:TColors.dark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(TSizes.cardRadiousMd),
                bottomRight:
                    Radius.circular(TSizes.productImageRadious),
              )),
          child:  SizedBox(
            width: TSizes.iconLg * 1.2,
            height: TSizes.iconLg * 1.2,
            child: Center(
              child: productQuantityInCart > 0 ? Text(productQuantityInCart.toString(),style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.white),) :Icon(Iconsax.add, color: TColors.white),
            ),
          ),
        );
      }
      ),
    );
  }
}