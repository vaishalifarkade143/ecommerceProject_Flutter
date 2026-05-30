import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecommerseproject/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerseproject/features/shop/controller/brand_controller.dart';
import 'package:ecommerseproject/features/shop/model/brand_model.dart';
import 'package:ecommerseproject/features/shop/screens/store/widgets/brand_card.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(brand.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Brand Details
              TBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: TSizes.spaceBtwSections),
              FutureBuilder(
                  future: controller.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    //handle Loading ,No Record Or Error Messages
                    const loader = TVerticalProductShimmer();
                    final widget =
                        TCloudHelperFunction.checkMultipleRecordsState(
                            snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;
                    ///Record found
                    final brandProducts = snapshot.data!;
                    return TSortebaleProducts(products: brandProducts);
                  }),
              // Pass the list of products for the brand
            ],
          ),
        ),
      ),
    );
  }
}
