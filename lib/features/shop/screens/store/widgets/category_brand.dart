import 'package:ecommerseproject/common/widgets/brands/brand_show_case.dart';
import 'package:ecommerseproject/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:ecommerseproject/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:ecommerseproject/features/shop/controller/brand_controller.dart';
import 'package:ecommerseproject/features/shop/model/category_model.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';

class CategoryBrand extends StatelessWidget {
  const CategoryBrand({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandForCategory(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              TListTileShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TBoxesShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          );
          final widget = TCloudHelperFunction.checkMultipleRecordsState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

//Record found
          final brands = snapshot.data!;
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_, index) {
                final brand = brands[index];
                return FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, asyncSnapshot) {
                    final widget = TCloudHelperFunction.checkMultipleRecordsState(
                        snapshot: asyncSnapshot, loader: loader);
                    if (widget != null) return widget;
                    final products = asyncSnapshot.data!;
                    return TBrandShowCase(
                      brand: brand,
                      images: products
                          .map((e) => e.thumbnail)
                          .where((url) => url.isNotEmpty)
                          .toList(),
                    );
                  },
                );
              });
        });
  }
}
