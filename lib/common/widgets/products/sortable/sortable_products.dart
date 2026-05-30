
import 'package:ecommerseproject/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerseproject/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:ecommerseproject/features/shop/controller/all_products_controller.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSortebaleProducts extends StatelessWidget {
  const TSortebaleProducts({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    //Initialize  controller for managing products sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);

    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            //sort products based on the selected option
            controller.sortProducts(value!);
          },
          items: [
            'Name',
            'Price',
            'Rating',
            'Lower Price',
            'Higher Price',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        ///products
        Obx(()=>
           TGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => TProductCardVertical(
              product: controller.products[index],
            ),
          ),
        )
      ],
    );
  }
}
