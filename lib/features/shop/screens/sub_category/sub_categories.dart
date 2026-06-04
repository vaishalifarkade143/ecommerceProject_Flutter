import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerseproject/common/widgets/products/product_cards/product_cart_horizontal.dart';
import 'package:ecommerseproject/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/features/shop/controller/category_controller.dart';
import 'package:ecommerseproject/features/shop/model/category_model.dart';
import 'package:ecommerseproject/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(category.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const TRoundedImage(
                imageUrl: TImages.promoBanner1,
                width: double.infinity,
                height: null,
                applyImageRadious: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Sub Categories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    //handle loader , no record,or error message
                    const loader = THorizontalProductShimmer();
                    final widget =
                        TCloudHelperFunction.checkMultipleRecordsState(
                      snapshot: snapshot,
                      loader: loader,
                    );
                    if (widget != null) return widget;
                    //Record found
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: subCategories.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final subCategory = subCategories[index];
                          return FutureBuilder(
                              future: controller.getCategoryProducts(
                                  categoryId: subCategory.id),
                              builder: (context, snapshot) {
                                //handle loader , no record,or error message
                                final widget = TCloudHelperFunction
                                    .checkMultipleRecordsState(
                                  snapshot: snapshot,
                                  loader: loader,
                                );
                                if (widget != null) return widget;
                                //Record found
                                final products = snapshot.data!;
                                return Column(
                                  children: [
                                    ///Heading
                                    TSectionHeading(
                                      title: subCategory.name,
                                      onPressed: () =>
                                          Get.to(() => AllProductsScreen(
                                                title: subCategory.name,
                                                futureMethod: controller
                                                    .getCategoryProducts(
                                                        categoryId:
                                                            subCategory.id,
                                                        limit: -1),
                                              )),
                                    ),
                                    const SizedBox(
                                        height: TSizes.spaceBtwSections / 2),
                                    SizedBox(
                                      height: 120,
                                      child: ListView.separated(
                                          itemCount: products.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                                width: TSizes.spaceBtwItems,
                                              ),
                                          itemBuilder: (context, index) =>
                                               TProductCardHorizontal(product: products[index])),
                                    ),
                                    const SizedBox(
                                        height: TSizes.spaceBtwSections),
                                  ],
                                );
                              });
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
